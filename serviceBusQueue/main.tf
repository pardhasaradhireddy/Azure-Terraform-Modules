#------------------
# ServiceBus Queue
#------------------
resource "azurerm_servicebus_queue" "servicebus_queue" {
  name                                    = var.servicebus_queue_name
  namespace_id                            = var.servicebus_id
  lock_duration                           = try(var.lock_duration, "PT1M")
  max_message_size_in_kilobytes           = try(var.max_message_size_in_kilobytes, null)
  max_size_in_megabytes                   = try(var.max_size_in_megabytes, null)
  requires_duplicate_detection            = try(var.requires_duplicate_detection, false)
  requires_session                        = try(var.requires_session, false)
  default_message_ttl                     = try(var.default_message_ttl, null)
  dead_lettering_on_message_expiration    = try(var.dead_lettering_on_message_expiration, false)
  duplicate_detection_history_time_window = try(var.duplicate_detection_history_time_window, "PT10M")
  max_delivery_count                      = try(var.max_delivery_count, 10)
  status                                  = try(var.status, "Active")
  batched_operations_enabled              = try(var.batched_operations_enabled, true)
  auto_delete_on_idle                     = try(var.auto_delete_on_idle, null)
  partitioning_enabled                    = try(var.partitioning_enabled, false)
  express_enabled                         = try(var.express_enabled, null)
  forward_to                              = try(var.forward_to, null)
  forward_dead_lettered_messages_to       = try(var.forward_dead_lettered_messages_to, null)
}

#--------------------
# Authorization Rule
#--------------------
resource "azurerm_servicebus_queue_authorization_rule" "read" {
  name     = "readonly"
  queue_id = azurerm_servicebus_queue.servicebus_queue.id
  listen   = true
  send     = false
  manage   = false
}

resource "azurerm_servicebus_queue_authorization_rule" "write" {
  name     = "write"
  queue_id = azurerm_servicebus_queue.servicebus_queue.id
  listen   = false
  send     = true
  manage   = false
}

#------------------
# Key Vault Secret
#------------------
locals {
  servicebus_queue_name_short = replace(replace(replace(var.servicebus_queue_name, "-se-dev-cus-01", ""), "-se-qa-cus-01", ""), "-se-prod-cus-01", "")
}

resource "azurerm_key_vault_secret" "write_connection_string" {
  name         = "sb-write-${local.servicebus_queue_name_short}"
  value        = azurerm_servicebus_queue_authorization_rule.write.primary_connection_string
  key_vault_id = var.key_vault_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

resource "azurerm_key_vault_secret" "read_connection_string" {
  name         = "sb-read-${local.servicebus_queue_name_short}"
  value        = azurerm_servicebus_queue_authorization_rule.read.primary_connection_string
  key_vault_id = var.key_vault_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-----------------
# Role Assignment
#-----------------
resource "azurerm_role_assignment" "sb" {
  for_each             = toset(var.rbac_principal_id)
  scope                = azurerm_servicebus_queue.servicebus_queue.id
  role_definition_name = var.role_definition_name
  principal_id         = each.value
}