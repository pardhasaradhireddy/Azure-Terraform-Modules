output "dcp_web_api_fqdn" {
  value = azurerm_app_service.dcp_web_api.default_site_hostname
}
