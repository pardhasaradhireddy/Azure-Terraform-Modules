# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "prometheus_api" {
  name                  = var.prometheus_api.name
  resource_group_name   = var.apim_resource_group_name
  api_management_name   = var.apim_name
  revision              = var.prometheus_api.revision
  display_name          = var.prometheus_api.display_name
  path                  = var.prometheus_api.path
  protocols             = var.prometheus_api.protocols
  service_url           = "${var.prometheus_api.service_protocol}://${var.public_dns_azure_firewall}/${var.prometheus_api.path}"
  subscription_required = var.prometheus_api.subscription_required
}


