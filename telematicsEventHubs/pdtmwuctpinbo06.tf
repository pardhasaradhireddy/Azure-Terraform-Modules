resource "azurerm_eventhub_namespace" "telematics_eventhubs_ns_5" {
  name                = var.eventhub_ns_5_name
  location            = azurerm_resource_group.telematics_eventhubs_rg.location
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_eventhub" "telematics_eventhub_5a" {
  name                = var.eventhub_5a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_5.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_5b" {
  name                = var.eventhub_5b_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_5.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_5c" {
  name                = var.eventhub_5c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_5.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_monitor_diagnostic_setting" "telematics_eventhubs_ns_5_diagnostics" {
  name                           = var.telematics_eventhubs_ns_5_diagnostics_name
  target_resource_id             = azurerm_eventhub_namespace.telematics_eventhubs_ns_5.id
  eventhub_name                  = var.activity_log_eventhub_name
  eventhub_authorization_rule_id = var.log_analytics_eventhub_ns_send_rule_primary_id

  log {
    category = "ArchiveLogs"

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "OperationalLogs"

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AutoScaleLogs"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
