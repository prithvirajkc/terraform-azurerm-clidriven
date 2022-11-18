output "public_ip" {
  value = azurerm_public_ip.myip.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.mac1.computer_name
}

output "vm_info" {
  value = azurerm_linux_virtual_machine.mac1.os_disk
}

output "subnet_address" {
  value = azurerm_subnet.sub1.address_prefixes
}