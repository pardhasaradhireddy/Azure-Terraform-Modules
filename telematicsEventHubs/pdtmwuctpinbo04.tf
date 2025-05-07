resource "azurerm_eventhub_namespace" "telematics_eventhubs_ns_4" {
  name                = var.eventhub_ns_4_name
  location            = azurerm_resource_group.telematics_eventhubs_rg.location
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_eventhub" "telematics_eventhub_4a" {
  name                = var.eventhub_4a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_4b" {
  name                = var.eventhub_4b_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_4c" {
  name                = var.eventhub_4c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub_consumer_group" "consumer_group_4a" {
  name                = var.consumer_group_4a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_4a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_4b" {
  name                = var.consumer_group_4b_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_4b.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_4c1" {
  name                = var.consumer_group_4c1_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_4c.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_4c2" {
  name                = var.consumer_group_4c2_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_4c.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_monitor_diagnostic_setting" "telematics_eventhubs_ns_4_diagnostics" {
  name                           = var.telematics_eventhubs_ns_4_diagnostics_name
  target_resource_id             = azurerm_eventhub_namespace.telematics_eventhubs_ns_4.id
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
