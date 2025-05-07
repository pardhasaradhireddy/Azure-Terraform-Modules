#---------------------
# Application Gateway
#---------------------
locals {
  gateway_ip_configuration_name          = "gw_ipcfg_${var.aks_app_gateway_name}"
  backend_address_pool_name              = "be_address_pool_${var.aks_app_gateway_name}"
  frontend_port_name                     = "fe_port_${var.aks_app_gateway_name}"
  frontend_public_ip_configuration_name  = "fe_public_ip_${var.aks_app_gateway_name}"
  frontend_private_ip_configuration_name = "fe_private_ip_${var.aks_app_gateway_name}"
  http_setting_name                      = "be_http_setting_${var.aks_app_gateway_name}"
  listener_name                          = "httplstn_${var.aks_app_gateway_name}"
  request_routing_rule_name              = "rqrt_${var.aks_app_gateway_name}"
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.aks_app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    capacity = var.sku.capacity
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_public_ip_configuration_name
    public_ip_address_id = var.public_ip
  }


  frontend_ip_configuration {
    name                          = local.frontend_private_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address            = var.private_ip_address
    private_ip_address_allocation = var.private_ip_allocation
  }

  firewall_policy_id = var.firewall_policy_id

  // Changes below will be changed be the AKS Cluster
  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_private_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority                   = 1000
  }

  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

  lifecycle {
    ignore_changes = [tags, backend_address_pool, backend_http_settings, frontend_port, http_listener, probe, request_routing_rule, ssl_certificate, url_path_map]
  }

  tags = var.tags
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "app_gateway_diagnostic_categories" {
  resource_id = azurerm_application_gateway.app_gateway.id
}

resource "azurerm_monitor_diagnostic_setting" "app_gateway_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_application_gateway.app_gateway.name}"
  target_resource_id             = azurerm_application_gateway.app_gateway.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.app_gateway_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.app_gateway_diagnostic_categories.metrics)

    content {
      category = metric.value

      retention_policy {
        enabled = true
      }
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}