#------------------
# ServiceBus Queue
#------------------
output "servicebus_queue_name" {
  description = "The ServiceBus Queue Name."
  value       = azurerm_servicebus_queue.servicebus_queue.name
}

output "servicebus_queue_id" {
  description = "The ServiceBus Queue ID."
  value       = azurerm_servicebus_queue.servicebus_queue.id
}

output "servicebus_queue_read_connection_string" {
  description = "Read Connection String"
  value       = azurerm_key_vault_secret.read_connection_string.value
  sensitive   = true
}

output "servicebus_queue_write_connection_string" {
  description = "Write Connection String"
  value       = azurerm_key_vault_secret.write_connection_string.value
  sensitive   = true
}