resource "azurerm_resource_group" "adx_resource_group" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_kusto_cluster" "adx_cluster" {
  name                = var.adx_name
  location            = var.location
  resource_group_name = azurerm_resource_group.adx_resource_group.name
  sku {
    name     = var.adx_sku
    capacity = var.adx_count
  }
  engine = "V3"
  identity {
    type = "SystemAssigned"
  }

  zones = ["1", "2", "3"]

  # Not supported in the current provider version
  # disk_encryption_enabled = true
  # streaming_ingestion_enabled = true

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

# Create three databases
resource "azurerm_kusto_database" "adx_databases" {
  count               = length(var.adx_databases)
  name                = var.adx_databases[count.index]
  location            = var.location
  resource_group_name = azurerm_resource_group.adx_resource_group.name
  cluster_name        = azurerm_kusto_cluster.adx_cluster.name
  soft_delete_period  = "P3650D"
  hot_cache_period    = "P30D"
}

resource "azurerm_monitor_diagnostic_setting" "diagnostics" {
  name                       = var.adx_diagnostics_name
  target_resource_id         = azurerm_kusto_cluster.adx_cluster.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  log {
    category = "SucceededIngestion"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "FailedIngestion"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "IngestionBatching"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Command"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "Query"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "TableUsageStatistics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "TableDetails"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
}

/* resource "azurerm_eventhub_namespace" "eventhub_ns" {
  name                = var.eventhub_ns_name //"coba-ingress-eventhub-ns"
  location            = var.location
  resource_group_name = azurerm_resource_group.adx_resource_group.name
  sku                 = var.eventhub_ns_sku
}

resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub_name //"coba-ingress-eventhub"
  namespace_name      = azurerm_eventhub_namespace.eventhub_ns.name
  resource_group_name = azurerm_resource_group.adx_resource_group.name
  partition_count     = var.partition_count //32
  message_retention   = var.message_retention //7
}

resource "azurerm_eventhub_consumer_group" "consumer_group" {
  name                = var.consumer_group //"coba-ingress-eventhub-consumergroup"
  namespace_name      = azurerm_eventhub_namespace.eventhub_ns.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = azurerm_resource_group.adx_resource_group.name
}

resource "azurerm_kusto_eventhub_data_connection" "eventhub_connection" {
  name                = var.data_connection //"coba-ingress-eventhub-data-connection"
  resource_group_name = azurerm_resource_group.adx_resource_group.name
  location            = azurerm_resource_group.adx_resource_group.name
  cluster_name        = azurerm_kusto_cluster.adx_cluster.name
  database_name       = azurerm_kusto_database.adx_databases.name

  eventhub_id    = azurerm_eventhub.eventhub.id
  consumer_group = azurerm_eventhub_consumer_group.consumer_group.name

  table_name        = "my-table"         #(Optional)
  mapping_rule_name = "my-table-mapping" #(Optional)
  data_format       = "JSON"             #(Optional)
} */
