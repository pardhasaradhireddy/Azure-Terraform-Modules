#----------------
# API Management
#----------------
resource "azurerm_api_management" "api_management" {
  name                = var.api_management_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name # Basic doesn't support virtual network, routing traffic from firewall (Basic for Dev and QA aswell)
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  min_api_version     = var.min_api_version

  identity {
    type         = var.identity.type
    identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
  }

  security {
    enable_backend_ssl30  = try(var.security.enable_backend_ssl30, false)
    enable_backend_tls10  = try(var.security.enable_backend_tls10, false)
    enable_backend_tls11  = try(var.security.enable_backend_tls11, false)
    enable_frontend_ssl30 = try(var.security.enable_frontend_ssl30, false)
    enable_frontend_tls10 = try(var.security.enable_frontend_tls10, false)
    enable_frontend_tls11 = try(var.security.enable_frontend_tls11, false)
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-----------------------
# API Management Policy
#-----------------------
resource "azurerm_api_management_policy" "api_management_policy" {
  api_management_id = azurerm_api_management.api_management.id
  xml_content       = file("${path.module}/global_policy.xml")
}

#-----------------------
# API Management Logger
#-----------------------
resource "azurerm_api_management_logger" "api_management_logger" {
  name                = var.api_management_logger_name
  api_management_name = azurerm_api_management.api_management.name
  resource_group_name = azurerm_api_management.api_management.resource_group_name
  resource_id         = var.resource_id

  application_insights {
    instrumentation_key = var.instrumentation_key
  }
}

#---------------------------
# API Management Diagnostic
#---------------------------
resource "azurerm_api_management_diagnostic" "api_management_diagnostic" {
  resource_group_name      = azurerm_api_management.api_management.resource_group_name
  api_management_name      = azurerm_api_management.api_management.name
  api_management_logger_id = azurerm_api_management_logger.api_management_logger.id
  identifier               = "applicationinsights"

  sampling_percentage       = var.sampling_percentage
  always_log_errors         = var.always_log_errors
  log_client_ip             = var.log_client_ip
  verbosity                 = var.verbosity
  http_correlation_protocol = var.http_correlation_protocol
}