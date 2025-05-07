#-------------------------
# Log Analytics Workspace
#-------------------------
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  allow_resource_only_permissions = try(var.allow_resource_only_permissions, true)
  local_authentication_disabled   = try(var.local_authentication_disabled, false)
  sku                             = try(var.sku, "PerGB2018")
  retention_in_days               = try(var.retention_in_days, null)
  daily_quota_gb                  = try(var.daily_quota_gb, -1)
  cmk_for_query_forced            = try(var.cmk_for_query_forced, null)

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  internet_ingestion_enabled              = try(var.internet_ingestion_enabled, true)
  internet_query_enabled                  = try(var.internet_query_enabled, true)
  reservation_capacity_in_gb_per_day      = try(var.sku, "PerGB2018") == "CapacityReservation" ? try(var.reservation_capacity_in_gb_per_day, null) : null
  data_collection_rule_id                 = try(var.data_collection_rule_id, null)
  immediate_data_purge_on_30_days_enabled = try(var.immediate_data_purge_on_30_days_enabled, null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}