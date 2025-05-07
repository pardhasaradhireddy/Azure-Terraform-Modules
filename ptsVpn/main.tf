#-----------
# Public IP
#-----------
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  sku_tier            = var.public_ip_sku_tier

  tags = var.tags
  lifecycle {
    ignore_changes = all
  }
}

#---------------
# Point-to-site
#---------------
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  name                = var.virtual_network_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.virtual_network_gateway_type
  vpn_type            = var.virtual_network_gateway_vpn_type
  active_active       = false
  enable_bgp          = false
  sku                 = var.virtual_network_gateway_sku
  custom_route {
    address_prefixes = var.additional_routes_to_advertise
  }

  ip_configuration {
    name                          = "vnetGatewayVpnConfig"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.virtual_network_gateway_subnet_id
  }


  vpn_client_configuration {
    address_space        = var.address_space
    vpn_auth_types       = var.vpn_auth_types
    aad_tenant           = var.aad_tenant
    aad_audience         = var.aad_audience
    aad_issuer           = var.aad_issuer
    vpn_client_protocols = var.vpn_client_protocols
  }

  tags = var.tags
  lifecycle {
    ignore_changes = all
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "virtual_network_gateway_diagnostic_categories" {
  resource_id = azurerm_virtual_network_gateway.virtual_network_gateway.id
}

resource "azurerm_monitor_diagnostic_setting" "virtual_network_gateway_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_virtual_network_gateway.virtual_network_gateway.name}"
  target_resource_id             = azurerm_virtual_network_gateway.virtual_network_gateway.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.virtual_network_gateway_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.virtual_network_gateway_diagnostic_categories.metrics)

    content {
      category = metric.value
      enabled  = contains(var.metrics, metric.value)

      retention_policy {
        enabled = contains(var.metrics, metric.value)
        days    = contains(var.metrics, metric.value) == true ? var.retention_days : 0
      }
    }
  }

  lifecycle {
    ignore_changes = [metric]
  }
}