# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend

resource "azurerm_api_management_backend" "cms_salesforce_validation_api" {
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  name                = var.cms_validation_backend.name
  protocol            = var.cms_validation_backend.protocol
  url                 = "https://${var.cms_salesforce_validation_fqdn}"
  tls {
    validate_certificate_chain = var.cms_validation_backend.tls.validate_certificate_chain
    validate_certificate_name  = var.cms_validation_backend.tls.validate_certificate_name
  }
}

resource "azurerm_api_management_backend" "cms_salesforce_subscription_api" {
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  name                = var.cms_subscription_backend.name
  protocol            = var.cms_subscription_backend.protocol
  url                 = "https://${var.cms_salesforce_subscription_fqdn}"
  tls {
    validate_certificate_chain = var.cms_subscription_backend.tls.validate_certificate_chain
    validate_certificate_name  = var.cms_subscription_backend.tls.validate_certificate_name
  }
}

resource "azurerm_api_management_backend" "cms_salesforce_security_api" {
  api_management_name = var.apim_name
  resource_group_name = var.apim_resource_group_name
  name                = var.cms_security_backend.name
  protocol            = var.cms_security_backend.protocol
  url                 = "https://${var.cms_salesforce_security_fqdn}"
  tls {
    validate_certificate_chain = var.cms_security_backend.tls.validate_certificate_chain
    validate_certificate_name  = var.cms_security_backend.tls.validate_certificate_name
  }
}
