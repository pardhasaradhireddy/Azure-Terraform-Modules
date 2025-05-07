#------------------
# Key Vault Secret
#------------------
output "id" {
  description = "The full resource ID of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.id
}

output "name" {
  description = "The name of the Key Vault secret."
  value       = azurerm_key_vault_secret.secret.name
}

output "value" {
  description = "The value of the Key Vault secret (sensitive)."
  value       = azurerm_key_vault_secret.secret.value
  sensitive   = true
}