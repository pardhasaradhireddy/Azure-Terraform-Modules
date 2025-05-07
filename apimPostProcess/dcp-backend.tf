# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend

resource "azurerm_api_management_backend" "dcp_agic" {
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  name                = var.dcp_backend.name
  protocol            = var.dcp_backend.protocol
  url                 = "https://${var.aks_app_gateway_private_fqdn}" #@todo do we still need this
  tls {
    validate_certificate_chain = var.dcp_backend.tls.validate_certificate_chain
    validate_certificate_name  = var.dcp_backend.tls.validate_certificate_name
  }
}
