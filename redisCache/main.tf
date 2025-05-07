resource "azurerm_resource_group" "cms_redis_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_redis_cache" "cms_redis_cache" {
  name                = var.redis_cache_name
  location            = azurerm_resource_group.cms_redis_rg.location
  resource_group_name = azurerm_resource_group.cms_redis_rg.name
  capacity            = 1
  family              = "P"
  sku_name            = "Premium"
  minimum_tls_version = "1.2"
  subnet_id           = var.spoke_redis_subnet_id

  redis_configuration {
    maxmemory_reserved              = 250
    maxfragmentationmemory_reserved = 1
  }

  tags = var.tags
  lifecycle { ignore_changes = [tags["CreatedDate"]] }
}

resource "azurerm_monitor_diagnostic_setting" "redis_diagnostics" {
  name                       = "redis_diagnostics"
  target_resource_id         = azurerm_redis_cache.cms_redis_cache.id
  log_analytics_workspace_id = var.log_analytics_workspace_uri

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
