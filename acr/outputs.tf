#--------------------------
# Azure Container Registry
#--------------------------
output "name" {
  description = "The Name of the Container Registry."
  value       = azurerm_container_registry.container_registry.name
}

output "id" {
  description = "The ID of the Container Registry."
  value       = azurerm_container_registry.container_registry.id
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.container_registry.login_server
}

output "identity" {
  description = "An identity block"
  value       = azurerm_container_registry.container_registry.identity
}