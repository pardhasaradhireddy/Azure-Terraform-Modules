resource "azurerm_eventhub_namespace" "telematics_eventhubs_ns_2" {
  name                = var.eventhub_ns_2_name
  location            = azurerm_resource_group.telematics_eventhubs_rg.location
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_eventhub" "telematics_eventhub_2a" {
  name                = var.eventhub_2a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2b" {
  name                = var.eventhub_2b_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2c" {
  name                = var.eventhub_2c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2d" {
  name                = var.eventhub_2d_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2e" {
  name                = var.eventhub_2e_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2f" {
  name                = var.eventhub_2f_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2g" {
  name                = var.eventhub_2g_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2h" {
  name                = var.eventhub_2h_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_2i" {
  name                = var.eventhub_2i_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub_consumer_group" "consumer_group_2c" {
  name                = var.consumer_group_2c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_2c.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_2e" {
  name                = var.consumer_group_2e_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_2e.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_2g" {
  name                = var.consumer_group_2g_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_2g.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_monitor_diagnostic_setting" "telematics_eventhubs_ns_2_diagnostics" {
  name                           = var.telematics_eventhubs_ns_2_diagnostics_name
  target_resource_id             = azurerm_eventhub_namespace.telematics_eventhubs_ns_2.id
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
