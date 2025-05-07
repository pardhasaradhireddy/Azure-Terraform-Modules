#---------------
# Frontdoor profile
#---------------
resource "azurerm_cdn_frontdoor_profile" "frontdoor" {
  name                = var.frontdoor_name
  resource_group_name = var.resource_group_name
  sku_name            = var.frontdoor_sku_name

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-------------------
# frontdoor endpoint
#-------------------
resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  for_each                 = var.frontdoor_endpoint
  name                     = each.value.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-----------------------
# frontdoor origin group
#-----------------------
resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  for_each                 = var.frontdoor_origin_group
  name                     = each.value.origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
  session_affinity_enabled = each.value.session_enabled

  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = each.value.time_healed_mins

  health_probe {
    interval_in_seconds = each.value.interval_seconds
    path                = each.value.path
    protocol            = each.value.protocol
    request_type        = each.value.request_type
  }

  load_balancing {
    additional_latency_in_milliseconds = each.value.add_latency_milliseconds
    sample_size                        = each.value.sample_size
    successful_samples_required        = each.value.successful_samples_required
  }
}

#-----------------
# frontdoor origin
#-----------------
resource "azurerm_cdn_frontdoor_origin" "origin" {
  for_each                      = var.frontdoor_origin
  name                          = each.value.origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group[each.value.origin_group].id
  enabled                       = each.value.origin_enabled

  certificate_name_check_enabled = each.value.certname_check_enabled

  host_name          = each.value.host_name
  http_port          = each.value.http_port
  https_port         = each.value.https_port
  origin_host_header = each.value.origin_host_header
  priority           = each.value.priority
  weight             = each.value.weight
}

data "azurerm_cdn_frontdoor_firewall_policy" "waf_id" {
  for_each            = var.frontdoor_security_policy
  name                = each.value.name
  resource_group_name = var.resource_group_name
}

#---------------------------
# Frontdoor Security Policy
#---------------------------

resource "azurerm_cdn_frontdoor_security_policy" "waf_policy" {
  for_each                 = var.frontdoor_security_policy
  name                     = each.value.name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id

  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = data.azurerm_cdn_frontdoor_firewall_policy.waf_id[each.value.frontdoor_security_policy_id].id
      association {
        dynamic "domain" {
          for_each = each.value.waf_domain
          content {
            cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_custom_domain.domain[domain.value.name].id
          }
        }
        patterns_to_match = ["/*"]
      }
    }
  }
}

#---------
# ruleset
#---------
resource "azurerm_cdn_frontdoor_rule_set" "rule_set" {
  for_each                 = var.rule_set
  name                     = each.value.rule_set_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
}

#-------
# rules
#-------
resource "azurerm_cdn_frontdoor_rule" "rule" {
  depends_on                = [azurerm_cdn_frontdoor_origin_group.origin_group, azurerm_cdn_frontdoor_origin.origin]
  for_each                  = var.rule
  name                      = each.value.name
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.rule_set[each.value.rule_set_name].id
  order                     = each.value.order
  behavior_on_match         = each.value.behavior_on_match

  actions {
    response_header_action {
      header_action = each.value.header_action
      header_name   = each.value.header_name
      value         = each.value.header_value
    }
  }
}

#----------------
# frontdoor route
#----------------
resource "azurerm_cdn_frontdoor_route" "frontdoor_route" {
  for_each                      = var.frontdoor_route
  name                          = each.value.frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint[each.value.endpoint].id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group[each.value.origin_group].id
  cdn_frontdoor_origin_path     = each.value.origin_path
  cdn_frontdoor_rule_set_ids    = try(each.value.rule_set, null) != null ? [azurerm_cdn_frontdoor_rule_set.rule_set[each.value.rule_set].id] : null
  enabled                       = each.value.frontdoor_route_enabled
  cdn_frontdoor_origin_ids      = length(each.value.origin) == 1 ? [azurerm_cdn_frontdoor_origin.origin[each.value.origin[0]].id] : [azurerm_cdn_frontdoor_origin.origin[each.value.origin[0]].id, azurerm_cdn_frontdoor_origin.origin[each.value.origin[1]].id]
  forwarding_protocol           = each.value.forwarding_protocol
  https_redirect_enabled        = each.value.https_redirect_enabled
  patterns_to_match             = each.value.patterns_to_match
  supported_protocols           = each.value.supported_protocols

  cdn_frontdoor_custom_domain_ids = try(each.value.domain, null) != null ? [for domain in each.value.domain : azurerm_cdn_frontdoor_custom_domain.domain[domain].id] : null
  link_to_default_domain          = each.value.link_to_default_domain

  dynamic "cache" {
    for_each = lookup(each.value, "cache_enabled", false) == true ? [each.value] : []
    content {
      query_string_caching_behavior = cache.value.query_string_caching_behavior
      query_strings                 = cache.value.query_settings
      compression_enabled           = cache.value.compression_enabled
      content_types_to_compress     = cache.value.content_types_to_compress
    }
  }
}

#---------------------
# Diagnostic Settings
#---------------------
data "azurerm_monitor_diagnostic_categories" "frontdoor_diagnostic_categories" {
  resource_id = azurerm_cdn_frontdoor_profile.frontdoor.id
}

resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostic_setting" {
  count                          = var.enable_diagnostic_settings == true ? 1 : 0
  name                           = "diag-${azurerm_cdn_frontdoor_profile.frontdoor.name}"
  target_resource_id             = azurerm_cdn_frontdoor_profile.frontdoor.id
  log_analytics_workspace_id     = var.law_id
  log_analytics_destination_type = try(var.log_analytics_destination_type)

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.frontdoor_diagnostic_categories.log_category_types)

    content {
      category = enabled_log.value

      retention_policy {
        enabled = contains(var.log_category_types, enabled_log.value)
        days    = contains(var.log_category_types, enabled_log.value) == true ? var.retention_days : 0
      }
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.frontdoor_diagnostic_categories.metrics)

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
    ignore_changes = [
      metric,
      enabled_log,
    ]
  }
}