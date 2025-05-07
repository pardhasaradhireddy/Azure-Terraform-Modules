# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api

resource "azurerm_api_management_api" "predmain_api" {
  api_management_name   = var.apim_name
  resource_group_name   = var.apim_resource_group_name
  name                  = var.predmain_api.name
  revision              = var.predmain_api.revision
  display_name          = var.predmain_api.display_name
  path                  = var.predmain_api.path
  protocols             = var.predmain_api.protocols
  service_url           = "${var.predmain_api.service_protocol}://${var.public_dns_azure_firewall}/${var.predmain_api.service_path}"
  subscription_required = var.predmain_api.subscription_required
  version               = var.predmain_api.version
  version_set_id        = azurerm_api_management_api_version_set.predmain_api_version_set.id
}
