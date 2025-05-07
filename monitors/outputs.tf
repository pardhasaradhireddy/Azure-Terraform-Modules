output "netwatcher" {
  value = zipmap(values(var.location), values(azurerm_network_watcher.netwatcher))
}

output "storage_id" {
  value = zipmap(values(var.location), values(azurerm_storage_account.storage).*.id)
}

output "log_workspace_uri" {
  value = zipmap(values(var.location), values(azurerm_log_analytics_workspace.log_workspace).*.id)
}

output "log_workspace_id" {
  value = zipmap(values(var.location), values(azurerm_log_analytics_workspace.log_workspace).*.workspace_id)
}

output "log_primary_shared_key" {
  value = zipmap(values(var.location), values(azurerm_log_analytics_workspace.log_workspace).*.primary_shared_key)
}

output "application_insights_instrumentation_key" {
  value = zipmap(values(var.location), values(azurerm_application_insights.application_insights).*.instrumentation_key)
}