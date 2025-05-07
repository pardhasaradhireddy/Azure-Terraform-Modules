#-------------------------
# Azure Monitor Workspace
#-------------------------
output "id" {
  description = "The resource ID of the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.monitor_workspace.id
}

output "name" {
  description = "The name of the Azure Monitor Workspace."
  value       = azurerm_monitor_workspace.monitor_workspace.name
}