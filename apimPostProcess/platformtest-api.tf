# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "platformtest_api" {
  name                  = var.platformtest_api.name
  resource_group_name   = var.apim_resource_group_name
  api_management_name   = var.apim_name
  revision              = var.platformtest_api.revision
  display_name          = var.platformtest_api.display_name
  path                  = var.platformtest_api.path
  protocols             = var.platformtest_api.protocols
  service_url           = "${var.platformtest_api.service_protocol}://${var.public_dns_azure_firewall}/${var.platformtest_api.path}"
  subscription_required = var.platformtest_api.subscription_required
}



