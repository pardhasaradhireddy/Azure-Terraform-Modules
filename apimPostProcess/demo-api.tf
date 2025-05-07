# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "demo_api" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  name                  = var.demo_api.name
  revision              = var.demo_api.revision
  display_name          = var.demo_api.display_name
  path                  = var.demo_api.path
  protocols             = var.demo_api.protocols
  service_url           = "${var.demo_api.service_protocol}://${var.public_dns_azure_firewall}/${var.demo_api.service_path}"
  subscription_required = var.demo_api.subscription_required
  version               = var.demo_api.version
  version_set_id        = azurerm_api_management_api_version_set.demo_api_version_set.id
}
