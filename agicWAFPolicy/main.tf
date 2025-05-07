resource "azurerm_web_application_firewall_policy" "web_application_firewall_policy" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "custom_rules" {
    for_each = var.custom_rules
    iterator = custom_rules
    content {
      name      = custom_rules.value.name
      priority  = custom_rules.value.priority
      rule_type = custom_rules.value.rule_type
      match_conditions {
        match_variables {
          variable_name = custom_rules.value.variable_name
        }
        operator           = custom_rules.value.operator
        negation_condition = custom_rules.value.negation_condition
        match_values       = custom_rules.value.match_values
      }
      action = custom_rules.value.action
    }
  }
  policy_settings {
    enabled                     = var.policy_settings.enabled
    mode                        = var.policy_settings.mode
    request_body_check          = var.policy_settings.request_body_check
    file_upload_limit_in_mb     = var.policy_settings.file_upload_limit_in_mb
    max_request_body_size_in_kb = var.policy_settings.max_request_body_size_in_kb
  }

  managed_rules {
    dynamic "exclusion" {
      for_each = var.waf_policy_exclusion
      iterator = waf_policy_exclusion
      content {
        match_variable          = waf_policy_exclusion.value.match_variable
        selector                = waf_policy_exclusion.value.selector
        selector_match_operator = waf_policy_exclusion.value.selector_match_operator
      }
    }
    dynamic "managed_rule_set" {
      for_each = var.managed_rule_set
      iterator = managed_rule_set
      content {
        type    = managed_rule_set.value.type
        version = managed_rule_set.value.version
        dynamic "rule_group_override" {
          for_each = managed_rule_set.value.rule_group_override
          iterator = rule_group_override
          content {
            rule_group_name = rule_group_override.value.rule_group_override_name
            dynamic "rule" {
              for_each = rule_group_override.value.rule
              iterator = rule
              content {
                id      = rule.value.id
                enabled = rule.value.enabled
                action  = rule.value.action
              }
            }
          }
        }
      }
    }
  }
  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}