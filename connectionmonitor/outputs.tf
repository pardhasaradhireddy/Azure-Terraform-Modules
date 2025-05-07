#-------------------------
#Azure Connection monitor
#-------------------------
output "network_connection_monitor_id" {
  description = "The ID of the Network Connection Monitor."
  value       = azurerm_network_connection_monitor.connection_monitor.id
}
