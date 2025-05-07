#-----------------
# Firewall Policy
#-----------------
resource "azurerm_firewall_policy" "firewall_policy" {
  name                = var.firewall_policy_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku_tier
  private_ip_ranges   = var.private_ip_ranges
  dns {
    # servers       = ["168.63.129.16"]
    proxy_enabled = true
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

#----------------------------------------
# Firewall Policy Rule Collection Groups
#----------------------------------------
#-------------------------
# rule_collection_group_1
#-------------------------
resource "azurerm_firewall_policy_rule_collection_group" "rule_collection_group_1" {
  name               = var.rule_collection_group_1
  priority           = 500
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id

  application_rule_collection {
    name     = "application_rule_collection_1"
    priority = 500
    action   = "Allow"
    dynamic "rule" {
      for_each = var.application_rules
      content {
        name        = rule.value.name
        description = lookup(rule.value, "description", null)
        dynamic "protocols" {
          for_each = rule.value.protocols
          content {
            type = protocols.value.type
            port = protocols.value.port
          }
        }
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_urls      = lookup(rule.value, "destination_urls", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
        destination_fqdn_tags = lookup(rule.value, "destination_fqdn_tags", null)
        terminate_tls         = lookup(rule.value, "terminate_tls", null)
        web_categories        = lookup(rule.value, "web_categories", null)
      }
    }
  }

  network_rule_collection {
    name     = "network_rule_collection_1"
    priority = 400
    action   = "Allow"

    dynamic "rule" {
      for_each = var.network_rules
      content {
        name                  = lookup(rule.value, "name", null)
        protocols             = lookup(rule.value, "protocols", null)
        destination_ports     = lookup(rule.value, "destination_ports", null)
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_ip_groups = lookup(rule.value, "destination_ip_groups", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
      }
    }
  }

  nat_rule_collection {
    name     = "nat_rule_collection_1"
    priority = 300
    action   = "Dnat"
    dynamic "rule" {
      for_each = var.nat_rules
      content {
        name                = lookup(rule.value, "name", null)
        protocols           = lookup(rule.value, "protocols", null)
        source_addresses    = lookup(rule.value, "source_addresses", null)
        source_ip_groups    = lookup(rule.value, "source_ip_groups", null)
        destination_address = lookup(rule.value, "destination_address", null)
        destination_ports   = lookup(rule.value, "destination_ports", null)
        translated_address  = lookup(rule.value, "translated_address", null)
        translated_fqdn     = lookup(rule.value, "translated_fqdn", null)
        translated_port     = lookup(rule.value, "translated_port", null)
      }
    }
  }

}

#---------------------------
# rule_collection_group_aks
#---------------------------
resource "azurerm_firewall_policy_rule_collection_group" "rule_collection_group_aks" {
  name               = var.rule_collection_group_aks
  priority           = 400
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id

  application_rule_collection {
    name     = "application_rule_collection_aks"
    priority = 500
    action   = "Allow"
    dynamic "rule" {
      for_each = var.application_rules_aks
      content {
        name        = rule.value.name
        description = lookup(rule.value, "description", null)
        dynamic "protocols" {
          for_each = rule.value.protocols
          content {
            type = protocols.value.type
            port = protocols.value.port
          }
        }
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_urls      = lookup(rule.value, "destination_urls", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
        destination_fqdn_tags = lookup(rule.value, "destination_fqdn_tags", null)
        terminate_tls         = lookup(rule.value, "terminate_tls", null)
        web_categories        = lookup(rule.value, "web_categories", null)
      }
    }
  }

  network_rule_collection {
    name     = "network_rule_collection_aks"
    priority = 400
    action   = "Allow"

    dynamic "rule" {
      for_each = var.network_rules_aks
      content {
        name                  = lookup(rule.value, "name", null)
        protocols             = lookup(rule.value, "protocols", null)
        destination_ports     = lookup(rule.value, "destination_ports", null)
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_ip_groups = lookup(rule.value, "destination_ip_groups", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
      }
    }
  }

}

#---------------------------
# rule_collection_group_cdp
#---------------------------
resource "azurerm_firewall_policy_rule_collection_group" "rule_collection_group_cdp" {
  name               = var.rule_collection_group_cdp
  priority           = 400
  firewall_policy_id = azurerm_firewall_policy.firewall_policy.id

  application_rule_collection {
    name     = "application_rule_collection_cdp"
    priority = 500
    action   = "Allow"
    dynamic "rule" {
      for_each = var.application_rules_cdp
      content {
        name        = rule.value.name
        description = lookup(rule.value, "description", null)
        dynamic "protocols" {
          for_each = rule.value.protocols
          content {
            type = protocols.value.type
            port = protocols.value.port
          }
        }
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_urls      = lookup(rule.value, "destination_urls", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
        destination_fqdn_tags = lookup(rule.value, "destination_fqdn_tags", null)
        terminate_tls         = lookup(rule.value, "terminate_tls", null)
        web_categories        = lookup(rule.value, "web_categories", null)
      }
    }
  }

  /* network_rule_collection {
    name     = "network_rule_collection_cdp"
    priority = 400
    action   = "Allow"

    dynamic "rule" {
      for_each = var.network_rules_cdp
      content {
        name                  = lookup(rule.value, "name", null)
        protocols             = lookup(rule.value, "protocols", null)
        destination_ports     = lookup(rule.value, "destination_ports", null)
        source_addresses      = lookup(rule.value, "source_addresses", null)
        source_ip_groups      = lookup(rule.value, "source_ip_groups", null)
        destination_addresses = lookup(rule.value, "destination_addresses", null)
        destination_ip_groups = lookup(rule.value, "destination_ip_groups", null)
        destination_fqdns     = lookup(rule.value, "destination_fqdns", null)
      }
    }
  } */

}

#----------------
# Azure Firewall
#----------------
resource "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  resource_group_name = azurerm_firewall_policy.firewall_policy.resource_group_name
  location            = azurerm_firewall_policy.firewall_policy.location
  sku_name            = var.sku_name
  sku_tier            = azurerm_firewall_policy.firewall_policy.sku
  firewall_policy_id  = azurerm_firewall_policy.firewall_policy.id

  ip_configuration {
    name                 = var.fw_ip_configuration_name
    subnet_id            = var.fw_subnet_id
    public_ip_address_id = var.fw_public_ip_address_id
  }

  management_ip_configuration {
    name                 = var.mgmt_ip_configuration_name
    subnet_id            = var.mgmt_subnet_id
    public_ip_address_id = var.mgmt_public_ip_address_id
  }

  ip_configuration {
    name                 = var.fw_apim_ip_configuration_name
    public_ip_address_id = var.fw_apim_public_ip_address_id
  }

  ip_configuration {
    name                 = var.fw_apim_qa_ip_configuration_name
    public_ip_address_id = var.fw_apim_qa_public_ip_address_id
  }

  ip_configuration {
    name                 = var.fw_apim_prod_ip_configuration_name
    public_ip_address_id = var.fw_apim_prod_public_ip_address_id
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "firewall_diagnostic_categories" {
  resource_id = azurerm_firewall.firewall.id
}

resource "azurerm_monitor_diagnostic_setting" "firewall_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_firewall.firewall.name}"
  target_resource_id             = azurerm_firewall.firewall.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.firewall_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.firewall_diagnostic_categories.metrics)

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