#-------------------
# App Configuration
#-------------------
output "app_configuration_id" {
  description = "The ID of the App Configuration resource."
  value       = azurerm_app_configuration.app_configuration.id
}

output "app_configuration_name" {
  description = "The name of the App Configuration resource."
  value       = azurerm_app_configuration.app_configuration.name
}

output "app_configuration_endpoint" {
  description = "The endpoint URL of the App Configuration resource."
  value       = azurerm_app_configuration.app_configuration.endpoint
}