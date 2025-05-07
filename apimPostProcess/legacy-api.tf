# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "legacy_api" {
  name                  = var.legacy_api.name
  resource_group_name   = var.apim_resource_group_name
  api_management_name   = var.apim_name
  revision              = var.legacy_api.revision
  display_name          = var.legacy_api.display_name
  path                  = var.legacy_api.path
  protocols             = var.legacy_api.protocols
  service_url           = "${var.legacy_api.service_protocol}://${var.public_dns_azure_firewall}/${var.legacy_api.path}"
  subscription_required = var.legacy_api.subscription_required
}

##################################
# apim policy
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy
##################################
resource "azurerm_api_management_api_policy" "eb_legacy_api_policy" {
  api_name            = azurerm_api_management_api.legacy_api.name
  api_management_name = azurerm_api_management_api.legacy_api.api_management_name
  resource_group_name = azurerm_api_management_api.legacy_api.resource_group_name
  xml_content = templatefile("${path.module}/legacy-eb-apim-policy.xml",
    { audience = var.eb_legacy_policy_identity.audience,
      issuer   = var.eb_legacy_policy_identity.issuer,
  config_url = var.eb_legacy_policy_identity.config_url })
}



# https://registry.terraform.io/providers/hashicorp/azurerm/2.41.0/docs/resources/api_management_api_diagnostic

# UNCOMMENT AND REDEPLOY AFTER REFACTORING TO ALL ENVIROMENTS!!!
# resource "azurerm_api_management_api_diagnostic" "legacy_api_diagnostic" {
#   resource_group_name      = var.apim_resource_group_name
#   api_management_name      = var.apim_name
#   api_name                 = var.legacy_api.name
#   api_management_logger_id = var.api_management_app_insights_logger_id
#   identifier               = "applicationinsights"

#   always_log_errors         = true
#   log_client_ip             = true
#   verbosity                 = "verbose"
#   http_correlation_protocol = "W3C"
# }
