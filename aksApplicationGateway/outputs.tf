#---------------------
# Application Gateway
#---------------------
output "aks_app_gateway_name" {
  description = "The name of the Azure Application Gateway associated with the AKS cluster."
  value       = azurerm_application_gateway.app_gateway.name
}

output "aks_app_gateway_private_fqdn" {
  description = "The private fully qualified domain name (FQDN) of the Application Gateway, retrieved from the private DNS A record."
  value       = trim(azurerm_private_dns_a_record.dcp_app_gateway_dns_a_record.fqdn, ".")
}

output "aks_app_gateway_id" {
  description = "The resource ID of the Azure Application Gateway."
  value       = azurerm_application_gateway.app_gateway.id
}

output "aks_app_gateway_rg_name" {
  description = "The name of the resource group containing the Azure Application Gateway."
  value       = azurerm_application_gateway.app_gateway.resource_group_name
}