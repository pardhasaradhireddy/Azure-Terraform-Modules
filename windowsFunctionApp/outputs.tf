
output "id" {
  value = azurerm_windows_function_app.windows_function_app.id
}

output "custom_domain_verification_id" {
  value = azurerm_windows_function_app.windows_function_app.custom_domain_verification_id
}

output "default_hostname" {
  value = azurerm_windows_function_app.windows_function_app.default_hostname
}

output "outbound_ip_addresses" {
  value = azurerm_windows_function_app.windows_function_app.outbound_ip_addresses
}

output "possible_ip_addresses" {
  value = azurerm_windows_function_app.windows_function_app.possible_outbound_ip_addresses
}

output "site_credential" {
  value = azurerm_windows_function_app.windows_function_app.site_credential
}

output "kind" {
  value = azurerm_windows_function_app.windows_function_app.kind
}

output "identity" {
  value = azurerm_windows_function_app.windows_function_app.identity
}
