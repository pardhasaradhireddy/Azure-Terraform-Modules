#-----------------------
# Key Vault Certificate
#-----------------------
output "certificate_attribute" {
  value = azurerm_key_vault_certificate.certificate.certificate_attribute
}