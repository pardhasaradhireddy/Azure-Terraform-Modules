# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "pushgateway_api" {
  count                 = var.enable_prometheus_pushgateway ? 1 : 0
  name                  = var.pushgateway_api.name
  resource_group_name   = var.apim_resource_group_name
  api_management_name   = var.apim_name
  revision              = var.pushgateway_api.revision
  display_name          = var.pushgateway_api.display_name
  path                  = var.pushgateway_api.path
  protocols             = var.pushgateway_api.protocols
  service_url           = "${var.pushgateway_api.service_protocol}://${var.public_dns_azure_firewall}/${var.pushgateway_api.path}"
  subscription_required = var.pushgateway_api.subscription_required
}
