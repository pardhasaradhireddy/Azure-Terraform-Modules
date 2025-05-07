resource "azurerm_eventhub_namespace" "telematics_eventhubs_ns_3" {
  name                = var.eventhub_ns_3_name
  location            = azurerm_resource_group.telematics_eventhubs_rg.location
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_eventhub" "telematics_eventhub_3a" {
  name                = var.eventhub_3a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3b" {
  name                = var.eventhub_3b_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3c" {
  name                = var.eventhub_3c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3d" {
  name                = var.eventhub_3d_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3e" {
  name                = var.eventhub_3e_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3f" {
  name                = var.eventhub_3f_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3g" {
  name                = var.eventhub_3g_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 2
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3h" {
  name                = var.eventhub_3h_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 2
  message_retention   = 7
}

resource "azurerm_eventhub" "telematics_eventhub_3i" {
  name                = var.eventhub_3i_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  partition_count     = 32
  message_retention   = 7
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3a" {
  name                = var.consumer_group_3a_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3a.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3b1" {
  name                = var.consumer_group_3b1_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3b.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3b2" {
  name                = var.consumer_group_3b2_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3b.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3b3" {
  name                = var.consumer_group_3b3_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3b.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3c" {
  name                = var.consumer_group_3c_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3c.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3i1" {
  name                = var.consumer_group_3i1_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3i.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_eventhub_consumer_group" "consumer_group_3i2" {
  name                = var.consumer_group_3i2_name
  namespace_name      = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.name
  eventhub_name       = azurerm_eventhub.telematics_eventhub_3i.name
  resource_group_name = azurerm_resource_group.telematics_eventhubs_rg.name
  user_metadata       = "some-meta-data"
}

resource "azurerm_monitor_diagnostic_setting" "telematics_eventhubs_ns_3_diagnostics" {
  name                           = var.telematics_eventhubs_ns_3_diagnostics_name
  target_resource_id             = azurerm_eventhub_namespace.telematics_eventhubs_ns_3.id
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
