#--------------------
# Linux Function App
#--------------------
output "name" {
  description = "The Name of the Linux Function App."
  value       = azurerm_linux_function_app.linux_function_app.name
}

output "id" {
  description = "The ID of the Linux Function App."
  value       = azurerm_linux_function_app.linux_function_app.id
}

output "custom_domain_verification_id" {
  description = "The identifier used by App Service to perform domain ownership verification via DNS TXT record."
  value       = azurerm_linux_function_app.linux_function_app.custom_domain_verification_id
}

output "default_hostname" {
  description = "The default hostname of the Linux Function App."
  value       = azurerm_linux_function_app.linux_function_app.default_hostname
}

output "hosting_environment_id" {
  description = "The ID of the App Service Environment used by Function App."
  value       = azurerm_linux_function_app.linux_function_app.hosting_environment_id
}

output "identity" {
  description = "An identity block"
  value       = azurerm_linux_function_app.linux_function_app.identity
}

output "kind" {
  description = "The Kind value for this Linux Function App."
  value       = azurerm_linux_function_app.linux_function_app.kind
}

output "outbound_ip_address_list" {
  description = "A list of outbound IP addresses. For example ['52.23.25.3', '52.143.43.12']"
  value       = azurerm_linux_function_app.linux_function_app.outbound_ip_address_list
}

output "outbound_ip_addresses" {
  description = "A comma separated list of outbound IP addresses as a string. For example 52.23.25.3,52.143.43.12."
  value       = azurerm_linux_function_app.linux_function_app.outbound_ip_addresses
}

output "possible_outbound_ip_address_list" {
  description = "A list of possible outbound IP addresses, not all of which are necessarily in use. This is a superset of outbound_ip_address_list. For example ['52.23.25.3', '52.143.43.12']."
  value       = azurerm_linux_function_app.linux_function_app.possible_outbound_ip_address_list
}

output "possible_outbound_ip_addresses" {
  description = "A comma separated list of possible outbound IP addresses as a string. For example 52.23.25.3,52.143.43.12,52.143.43.17. This is a superset of outbound_ip_addresses."
  value       = azurerm_linux_function_app.linux_function_app.possible_outbound_ip_addresses
}

output "site_credential" {
  description = "A site_credential block"
  value       = azurerm_linux_function_app.linux_function_app.site_credential
}