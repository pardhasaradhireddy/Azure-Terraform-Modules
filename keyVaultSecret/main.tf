#------------------
# Key Vault Secret
#------------------
resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = var.key_vault_id
  content_type = var.content_type

  tags            = var.tags
  expiration_date = try(var.expiration_date, null)
  lifecycle {
    ignore_changes = [
      tags["created_date"],
      value,
      not_before_date
    ]
  }
}