#---------------
# Event Grid System Topic Event Subscription
#---------------
output "id" {
  value = azurerm_eventgrid_system_topic_event_subscription.event_grid_system_topic_event_subscription.id
}

output "name" {
  value = azurerm_eventgrid_system_topic_event_subscription.event_grid_system_topic_event_subscription.name
}

output "resource_group_name" {
  value = azurerm_eventgrid_system_topic_event_subscription.event_grid_system_topic_event_subscription.resource_group_name
}
