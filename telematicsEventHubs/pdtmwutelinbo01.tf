resource "azurerm_eventhub_namespace" "telematics_eventhubs_ns_7" {
  name                = var.eventhub_ns_7_name
  location            = azurerm_resource_group.telematics_eventhubs_rg.location
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_eventhub" "telematics_eventhub_7a" {
  name                = var.eventhub_7a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub_consumer_group" "consumer_group_7a1" {
  name                = var.consumer_group_7a1_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_7a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_7a2" {
  name                = var.consumer_group_7a2_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_7a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_7a3" {
  name                = var.consumer_group_7a3_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_7a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_7a4" {
  name                = var.consumer_group_7a4_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_7a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_monitor_diagnostic_setting" "telematics_eventhubs_ns_7_diagnostics" {
  name                           = var.telematics_eventhubs_ns_7_diagnostics_name
  target_resource_id             = azurerm_eventhub_namespace.telematics_eventhubs_ns_7.id
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
