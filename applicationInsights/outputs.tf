#----------------------
# Application Insights
#----------------------
output "id" {
  description = "The ID of the Application Insights resource."
  value       = azurerm_application_insights.application_insights.id
}

output "name" {
  description = "The name of the Application Insights resource."
  value       = azurerm_application_insights.application_insights.name
}

output "app_id" {
  description = "The unique Application ID associated with Application Insights."
  value       = azurerm_application_insights.application_insights.app_id
}

output "instrumentation_key" {
  description = "The instrumentation key used to send telemetry data to Application Insights."
  value       = azurerm_application_insights.application_insights.instrumentation_key
}

output "connection_string" {
  description = "The connection string used to connect to Application Insights for telemetry data ingestion."
  value       = azurerm_application_insights.application_insights.connection_string
}