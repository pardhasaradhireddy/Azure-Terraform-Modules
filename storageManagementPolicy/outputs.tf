#----------------
# Storage Management Policy Outputs
#----------------
output "id" {
  description = "The ID of the Storage Management Policy."
  value       = azurerm_storage_management_policy.storage_management_policy.id
}