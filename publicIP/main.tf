#-----------
# Public IP
#-----------
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
  sku_tier            = var.sku_tier
  domain_name_label   = var.domain_name_label

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "public_ip_diagnostic_categories" {
  resource_id = azurerm_public_ip.public_ip.id
}

resource "azurerm_monitor_diagnostic_setting" "public_ip_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_public_ip.public_ip.name}"
  target_resource_id             = azurerm_public_ip.public_ip.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.public_ip_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.public_ip_diagnostic_categories.metrics)

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