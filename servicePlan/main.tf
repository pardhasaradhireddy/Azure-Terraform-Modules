#--------------
# Service Plan
#--------------
resource "azurerm_service_plan" "service_plan" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  os_type                      = var.os_type
  sku_name                     = var.sku_name
  app_service_environment_id   = try(var.app_service_environment_id, null)
  maximum_elastic_worker_count = try(var.maximum_elastic_worker_count, null)
  worker_count                 = try(var.worker_count, 1)
  per_site_scaling_enabled     = try(var.per_site_scaling_enabled, false)
  zone_balancing_enabled       = try(var.zone_balancing_enabled, false)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#-----------------
# Management Lock
#-----------------
resource "azurerm_management_lock" "management_lock" {
  count      = var.enable_management_lock == true ? 1 : 0
  name       = "mgmt-lock-${azurerm_service_plan.service_plan.name}"
  scope      = azurerm_service_plan.service_plan.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion"
}