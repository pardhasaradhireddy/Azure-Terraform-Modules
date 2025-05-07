output "cms_redis_cache_primary_access_key" {
  value = azurerm_redis_cache.cms_redis_cache.primary_access_key
}

output "cms_redis_cache_secondary_access_key" {
  value = azurerm_redis_cache.cms_redis_cache.secondary_access_key
}

variable "tags" {}