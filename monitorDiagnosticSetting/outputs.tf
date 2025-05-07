#----------------------------
# Monitor Diagnostic Setting
#----------------------------
output "id" {
  description = "The ID of the Diagnostic Setting."
  value       = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting.id
}

output "name" {
  description = "The Name of the Diagnostic Setting."
  value       = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting.name
}