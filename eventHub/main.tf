#----------
# EventHub
#----------
resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub_name
  namespace_name      = var.eventhub_namespace
  resource_group_name = var.eventhub_rg
  partition_count     = var.partition_count
  message_retention   = var.message_retention

  dynamic "capture_description" {
    for_each = try(var.capture_description, {}) != {} ? [var.capture_description] : []
    content {
      enabled             = capture_description.value.enabled
      encoding            = capture_description.value.encoding
      interval_in_seconds = lookup(capture_description.value, "interval_in_seconds", "300")
      size_limit_in_bytes = lookup(capture_description.value, "size_limit_in_bytes", "314572800")
      skip_empty_archives = lookup(capture_description.value, "skip_empty_archives", false)
      dynamic "destination" {
        for_each = lookup(capture_description.value, "destination", {}) != {} ? [capture_description.value.destination] : []
        content {
          name                = destination.value.name
          archive_name_format = destination.value.archive_name_format
          blob_container_name = destination.value.blob_container_name
          storage_account_id  = destination.value.storage_account_id
        }
      }
    }
  }

  status = try(var.status, "Active")
}

#--------------------------
# EventHub Consumer Groups
#--------------------------
resource "azurerm_eventhub_consumer_group" "consumer_groups" {
  for_each            = toset(var.consumer_group_list)
  name                = each.key
  namespace_name      = azurerm_eventhub.eventhub.namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = azurerm_eventhub.eventhub.resource_group_name
}

#------------------------------
# EventHub Authorization Rules
#------------------------------
resource "azurerm_eventhub_authorization_rule" "read" {
  name                = "readonly"
  namespace_name      = azurerm_eventhub.eventhub.namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = azurerm_eventhub.eventhub.resource_group_name
  listen              = true
  send                = false
  manage              = false
}

resource "azurerm_eventhub_authorization_rule" "write" {
  name                = "write"
  namespace_name      = azurerm_eventhub.eventhub.namespace_name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = azurerm_eventhub.eventhub.resource_group_name
  listen              = false
  send                = true
  manage              = false
}

#-------------------
# Key Vault Secrets
#-------------------
locals {
  eventhub_name_short = replace(replace(replace(var.eventhub_name, "-se-dev-cus-01", ""), "-se-qa-cus-01", ""), "-se-prod-cus-01", "")
}

resource "azurerm_key_vault_secret" "write_connection_string" {
  name         = "evh-write-${local.eventhub_name_short}"
  value        = azurerm_eventhub_authorization_rule.write.primary_connection_string
  key_vault_id = var.key_vault_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

resource "azurerm_key_vault_secret" "read_connection_string" {
  name         = "evh-read-${local.eventhub_name_short}"
  value        = azurerm_eventhub_authorization_rule.read.primary_connection_string
  key_vault_id = var.key_vault_id

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#------------------
# Role Assignments
#------------------
resource "azurerm_role_assignment" "evh" {
  for_each             = toset(var.rbac_principal_id)
  scope                = azurerm_eventhub.eventhub.id
  role_definition_name = var.role_definition_name
  principal_id         = each.value
}