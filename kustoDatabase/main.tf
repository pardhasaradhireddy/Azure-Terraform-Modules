resource "azurerm_kusto_database" "kusto_database" {

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = var.cluster_name

  hot_cache_period   = try(var.hot_cache_period, null)
  soft_delete_period = try(var.soft_delete_period, null)
}