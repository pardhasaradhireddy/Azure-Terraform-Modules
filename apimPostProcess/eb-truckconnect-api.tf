# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "eb_truckconnect_api" {
  name                  = var.eb_truckconnect_api.name
  resource_group_name   = var.apim_resource_group_name
  api_management_name   = var.apim_name
  revision              = var.eb_truckconnect_api.revision
  display_name          = var.eb_truckconnect_api.display_name
  path                  = var.eb_truckconnect_api.path
  protocols             = var.eb_truckconnect_api.protocols
  service_url           = "${var.eb_truckconnect_api.service_protocol}://${var.public_dns_azure_firewall}/${var.eb_truckconnect_api.path}"
  subscription_required = var.eb_truckconnect_api.subscription_required
}

##################################
# apim policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy
##################################
resource "azurerm_api_management_api_policy" "eb_truckconnect_api_policy" {
  api_name            = azurerm_api_management_api.eb_truckconnect_api.name
  api_management_name = azurerm_api_management_api.eb_truckconnect_api.api_management_name
  resource_group_name = azurerm_api_management_api.eb_truckconnect_api.resource_group_name
  xml_content = templatefile("${path.module}/eb-truck-connect-apim-policy.xml",
    { audience = var.eb_truckconnect_policy_identity.audience,
      role     = var.eb_truckconnect_policy_identity.required_role,
  eb_truckconnect_tenant_id = var.eb_truckconnect_policy_identity.tenant_id })
}


# https://registry.terraform.io/providers/hashicorp/azurerm/2.41.0/docs/resources/api_management_api_diagnostic

# UNCOMMENT AND REDEPLOY AFTER REFACTORING TO ALL ENVIROMENTS!!!
# resource "azurerm_api_management_api_diagnostic" "eb_truckconnect_api_diagnostic" {
#   resource_group_name      = var.apim_resource_group_name
#   api_management_name      = var.apim_name
#   api_name                 = var.eb_truckconnect_api.name
#   api_management_logger_id = var.api_management_app_insights_logger_id
#   identifier               = "applicationinsights"

#   always_log_errors         = true
#   log_client_ip             = true
#   verbosity                 = "verbose"
#   http_correlation_protocol = "W3C"
# }
