#-----------------------
# Service Bus Namespace
#-----------------------
output "name" {
  description = "The ServiceBus Namespace Name."
  value       = azurerm_servicebus_namespace.servicebus_ns.name
}

output "id" {
  description = "The ServiceBus Namespace ID."
  value       = azurerm_servicebus_namespace.servicebus_ns.id
}

output "default_primary_connection_string" {
  description = "The primary connection string for the authorization rule RootManageSharedAccessKey."
  value       = azurerm_servicebus_namespace.servicebus_ns.default_primary_connection_string
}

#------------------
# ServiceBus Queue
#------------------
output "servicebus_queue" {
  description = "The ServiceBus Queue"
  value       = module.servicebus_queue
}