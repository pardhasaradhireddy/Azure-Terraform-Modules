#-------------------------
# Windows Virtual Machine
#-------------------------
output "id" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine.id
}

output "private_ip_address" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine.private_ip_address
}

output "private_ip_addresses" {
  value = azurerm_windows_virtual_machine.windows_virtual_machine.private_ip_addresses
}