locals {
  today_date      = formatdate("YYYY-MM-DD", timestamp())
  expiry_in_hours = var.blob_storage_container_sas_expiry_in_years * 365 * 24
  expiry_date     = timeadd(timestamp(), "${local.expiry_in_hours}h")
}

data "azurerm_storage_account_blob_container_sas" "sas_connection_string" {
  connection_string = var.blob_storage_account_primary_connection_string
  container_name    = var.blob_storage_container_name
  https_only        = true

  start  = local.today_date
  expiry = local.expiry_date

  permissions {
    read   = lookup(var.blob_storage_container_sas_permissions, "read", false)
    add    = lookup(var.blob_storage_container_sas_permissions, "add", false)
    create = lookup(var.blob_storage_container_sas_permissions, "create", false)
    write  = lookup(var.blob_storage_container_sas_permissions, "write", false)
    delete = lookup(var.blob_storage_container_sas_permissions, "delete", false)
    list   = lookup(var.blob_storage_container_sas_permissions, "list", false)
  }
  cache_control       = var.cache_control
  content_disposition = var.content_disposition
  content_encoding    = var.content_encoding
  content_language    = var.content_language
  content_type        = var.content_type
}