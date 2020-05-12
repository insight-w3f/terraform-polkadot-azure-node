output "public_ip" {
  value = azurerm_linux_virtual_machine.this.0.public_ip_address
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.this.0.private_ip_address
}

output "user_data" {
  value = azurerm_linux_virtual_machine.this.0.custom_data
}