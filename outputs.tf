output "public_ip" {
  value = azurerm_linux_virtual_machine.this.*.public_ip_addresses
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.this.*.private_ip_addresses
}

output "user_data" {
  value = azurerm_linux_virtual_machine.this.*.custom_data
}