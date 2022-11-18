resource "azurerm_virtual_network" "vnet1" {
  name = local.vnet-name
  resource_group_name = azurerm_resource_group.grp1.name
  location = azurerm_resource_group.grp1.location
  address_space = var.vnet-space
}

resource "azurerm_subnet" "sub1" {
  name = local.subnet-name
  resource_group_name = azurerm_resource_group.grp1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes = [ "10.0.0.0/24" ]
}



resource "azurerm_public_ip" "myip" {
  name = var.ip-name
  resource_group_name = azurerm_resource_group.grp1.name
  location = azurerm_resource_group.grp1.location
  allocation_method = "Static"
}

resource "azurerm_network_interface" "NI" {
  name = var.NI-name
  resource_group_name = azurerm_resource_group.grp1.name
  location = azurerm_resource_group.grp1.location
  ip_configuration {
    name = "ifconfig"
    subnet_id = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.myip.id
  }
}