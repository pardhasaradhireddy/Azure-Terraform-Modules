#------------------------
# Network Security Group
#------------------------
resource "azurerm_network_security_group" "network_security_group" {
  name                = var.network_security_group_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

resource "azurerm_network_security_rule" "inbound" {
  for_each                                   = { for rule in var.inbound_rules : rule.name => rule }
  resource_group_name                        = azurerm_network_security_group.network_security_group.resource_group_name
  network_security_group_name                = azurerm_network_security_group.network_security_group.name
  direction                                  = "Inbound"
  name                                       = each.value.name
  priority                                   = each.value.priority
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_address_prefix                      = lookup(each.value, "source_address_prefix", null)
  source_address_prefixes                    = lookup(each.value, "source_address_prefixes", null)
  source_application_security_group_ids      = lookup(each.value, "source_application_security_group_ids", null)
  source_port_range                          = lookup(each.value, "source_port_range", null)
  source_port_ranges                         = lookup(each.value, "source_port_ranges", null)
  destination_address_prefix                 = lookup(each.value, "destination_address_prefix", null)
  destination_address_prefixes               = lookup(each.value, "destination_address_prefixes", null)
  destination_application_security_group_ids = lookup(each.value, "destination_application_security_group_ids", null)
  destination_port_range                     = lookup(each.value, "destination_port_range", null)
  destination_port_ranges                    = lookup(each.value, "destination_port_ranges", null)
  description                                = lookup(each.value, "description", null)
}

resource "azurerm_network_security_rule" "outbound" {
  for_each                                   = { for rule in var.outbound_rules : rule.name => rule }
  resource_group_name                        = azurerm_network_security_group.network_security_group.resource_group_name
  network_security_group_name                = azurerm_network_security_group.network_security_group.name
  direction                                  = "Outbound"
  name                                       = each.value.name
  priority                                   = each.value.priority
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_address_prefix                      = lookup(each.value, "source_address_prefix", null)
  source_address_prefixes                    = lookup(each.value, "source_address_prefixes", null)
  source_application_security_group_ids      = lookup(each.value, "source_application_security_group_ids", null)
  source_port_range                          = lookup(each.value, "source_port_range", null)
  source_port_ranges                         = lookup(each.value, "source_port_ranges", null)
  destination_address_prefix                 = lookup(each.value, "destination_address_prefix", null)
  destination_address_prefixes               = lookup(each.value, "destination_address_prefixes", null)
  destination_application_security_group_ids = lookup(each.value, "destination_application_security_group_ids", null)
  destination_port_range                     = lookup(each.value, "destination_port_range", null)
  destination_port_ranges                    = lookup(each.value, "destination_port_ranges", null)
  description                                = lookup(each.value, "description", null)
}

#------------------------
# Subnet NSG Association
#------------------------
resource "azurerm_subnet_network_security_group_association" "snet_nsg_association" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "network_security_group_diagnostic_categories" {
  resource_id = azurerm_network_security_group.network_security_group.id
}

resource "azurerm_monitor_diagnostic_setting" "network_security_group_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_network_security_group.network_security_group.name}"
  target_resource_id             = azurerm_network_security_group.network_security_group.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.network_security_group_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.network_security_group_diagnostic_categories.metrics)

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