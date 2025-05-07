resource "azurerm_kusto_cluster" "kusto_cluster" {
  name                = replace(var.name, "-", "")
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku.name
    capacity = var.sku.capacity
  }

  engine                    = var.engine
  allowed_fqdns             = var.allowed_fqdns
  allowed_ip_ranges         = var.allowed_ip_ranges
  double_encryption_enabled = var.double_encryption_enabled

  identity {
    type         = var.identity.type
    identity_ids = var.identity.type == "UserAssigned" ? var.identity.identity_ids : []
  }


  auto_stop_enabled = var.auto_stop_enabled


  optimized_auto_scale {
    minimum_instances = var.optimized_auto_scale.minimum_instances
    maximum_instances = var.optimized_auto_scale.maximum_instances
  }


  dynamic "virtual_network_configuration" {
    for_each = var.virtual_network_configuration

    content {
      subnet_id                    = virtual_network_configuration.value.subnet_id
      engine_public_ip_id          = virtual_network_configuration.value.engine_public_ip_id
      data_management_public_ip_id = virtual_network_configuration.value.data_management_public_ip_id
    }
  }

  zones                              = var.zones
  disk_encryption_enabled            = var.disk_encryption_enabled
  streaming_ingestion_enabled        = var.streaming_ingestion_enabled
  public_ip_type                     = var.public_ip_type
  public_network_access_enabled      = var.public_network_access_enabled
  outbound_network_access_restricted = var.outbound_network_access_restricted
  purge_enabled                      = var.purge_enabled
  language_extensions                = var.language_extensions
  trusted_external_tenants           = var.trusted_external_tenants
  tags                               = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}


resource "azurerm_monitor_diagnostic_setting" "diagnostics" {
  name                       = var.diagnostics_name
  target_resource_id         = azurerm_kusto_cluster.kusto_cluster.id
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
