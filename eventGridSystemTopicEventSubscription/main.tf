#---------------
# Event Grid System Topic Event Subscription
#---------------
resource "azurerm_eventgrid_system_topic_event_subscription" "event_grid_system_topic_event_subscription" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  system_topic         = var.system_topic_name
  included_event_types = var.included_event_types
  subject_filter {
    case_sensitive      = true
    subject_begins_with = var.filter_begins_with
  }

  azure_function_endpoint {
    function_id = var.azure_function_id
  }
  lifecycle {
    ignore_changes = [
      azure_function_endpoint,
    ]
  }
}