#----------
# EventHub
#----------
output "event_hub_id" {
  description = "The ID of the EventHub."
  value       = azurerm_eventhub.eventhub.id
}

output "event_hub_name" {
  description = "The Name of the EventHub."
  value       = azurerm_eventhub.eventhub.name
}

output "partition_ids" {
  description = "The identifiers for partitions created for Event Hubs."
  value       = azurerm_eventhub.eventhub.partition_ids
}