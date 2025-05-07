#----------------------------------
# Resource Group Policy Assignment
#----------------------------------
resource "azurerm_resource_group_policy_assignment" "resource_group_policy_assignment" {
  name                 = var.resource_group_policy_assignment_name
  policy_definition_id = var.policy_definition_id
  resource_group_id    = var.resource_group_id
  description          = try(var.description, null)
  display_name         = try(var.display_name, null)
  enforce              = try(var.enforce, true)

  dynamic "identity" {
    for_each = var.location != null && try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  location = try(var.location, null)
  metadata = try(var.metadata, null)

  dynamic "non_compliance_message" {
    for_each = try(var.non_compliance_message) != null ? [var.non_compliance_message] : []
    content {
      content                        = non_compliance_message.value.content
      policy_definition_reference_id = lookup(non_compliance_message.value, "policy_definition_reference_id", null)
    }
  }

  not_scopes = try(var.not_scopes, [])
  parameters = try(var.parameters, null)

  dynamic "overrides" {
    for_each = try(var.overrides) != null ? [var.overrides] : []
    content {
      value = overrides.value.value
      dynamic "selectors" {
        for_each = try(overrides.value.selectors) != null ? [overrides.value.selectors] : []
        content {
          in     = lookup(selectors.value, "in", [])
          not_in = lookup(selectors.value, "not_in", [])
        }
      }
    }
  }

  dynamic "resource_selectors" {
    for_each = try(var.resource_selectors) != null ? [var.resource_selectors] : []
    content {
      name = lookup(resource_selectors.value, "name", null)
      dynamic "selectors" {
        for_each = try(resource_selectors.value.selectors) != null ? [resource_selectors.value.selectors] : []
        content {
          kind   = selectors.value.kind
          in     = lookup(selectors.value, "in", [])
          not_in = lookup(selectors.value, "not_in", [])
        }
      }
    }
  }
}