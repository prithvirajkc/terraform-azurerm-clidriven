resource "azurerm_linux_virtual_machine" "mac1" {
  name = var.vm-name
  resource_group_name = azurerm_resource_group.grp1.name
  location = azurerm_resource_group.grp1.location
  size = "Standard_LRS"
  admin_username = "azureuser"
  network_interface_ids = [ azurerm_network_interface.NI.id ]
  admin_ssh_key {
    username = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    name = "disk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer = "RHEL"
    publisher = "RedHat"
    sku = "83-gen2"
    version = "latest"
  }
}