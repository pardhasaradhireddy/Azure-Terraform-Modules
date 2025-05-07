#-----------
# Key Vault
#-----------
output "name" {
  description = "The Name of the Key Vault."
  value       = azurerm_key_vault.key_vault.name
}

output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.key_vault.id
}

output "vault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value       = azurerm_key_vault.key_vault.vault_uri
}