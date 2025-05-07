#---------------
# Event Grid System Topic
#---------------
output "id" {
  value = azurerm_eventgrid_system_topic.event_grid_system_topic.id
}

output "identity" {
  value = azurerm_eventgrid_system_topic.event_grid_system_topic.identity
}

output "name" {
  value = azurerm_eventgrid_system_topic.event_grid_system_topic.name
}

output "location" {
  value = azurerm_eventgrid_system_topic.event_grid_system_topic.location
}

output "resource_group_name" {
  value = azurerm_eventgrid_system_topic.event_grid_system_topic.resource_group_name
}
