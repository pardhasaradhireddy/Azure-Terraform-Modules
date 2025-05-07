#----------------
# API Management
#----------------
output "portal_url" {
  description = "The developer portal URL of the API Management service."
  value       = azurerm_api_management.api_management.portal_url
}

output "id" {
  description = "The resource ID of the API Management service."
  value       = azurerm_api_management.api_management.id
}

output "name" {
  description = "The name of the API Management service."
  value       = azurerm_api_management.api_management.name
}

output "resource_group_name" {
  description = "The name of the resource group containing the API Management service."
  value       = azurerm_api_management.api_management.resource_group_name
}

#-----------------------
# API Management Logger
#-----------------------
output "logger_id" {
  description = "The resource ID of the API Management Logger."
  value       = azurerm_api_management_logger.api_management_logger.id
}