#-------------------------
# Azure Connection monitor
#-------------------------

resource "azurerm_network_connection_monitor" "connection_monitor" {
  name               = var.connection_monitor_name
  location           = var.connection_monitor_location
  tags               = var.tags
  network_watcher_id = var.network_watcher_id

  dynamic "endpoint" {
    for_each = var.endpoints
    content {
      name                 = endpoint.value.name
      target_resource_type = endpoint.value.target_resource_type
      target_resource_id   = endpoint.value.target_resource_id
      address              = endpoint.value.address
    }
  }

  dynamic "test_configuration" {
    for_each = var.test_configurations
    content {
      name                      = test_configuration.value.name
      test_frequency_in_seconds = test_configuration.value.test_frequency_in_seconds
      protocol                  = test_configuration.value.protocol

      dynamic "http_configuration" {
        for_each = lookup(test_configuration.value, "http_configuration", [])
        content {
          method = http_configuration.value.method
          path   = http_configuration.value.path
        }
      }

      dynamic "tcp_configuration" {
        for_each = lookup(test_configuration.value, "tcp_configuration", [])
        content {
          port = tcp_configuration.value.port
        }
      }
    }
  }

  dynamic "test_group" {
    for_each = var.test_groups
    content {
      name                     = test_group.value.name
      destination_endpoints    = test_group.value.destination_endpoints
      test_configuration_names = test_group.value.test_configuration_names
      source_endpoints         = test_group.value.source_endpoints
    }
  }
}
