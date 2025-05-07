#---------------------------
# Storage Management Policy
#---------------------------
resource "azurerm_storage_management_policy" "storage_management_policy" {
  storage_account_id = var.storage_account_id
  rule {
    name    = var.rule_name
    enabled = true
    filters {
      blob_types = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than = var.days_to_cold_storage
        delete_after_days_since_modification_greater_than       = var.days_to_deletion
      }
    }
  }
}