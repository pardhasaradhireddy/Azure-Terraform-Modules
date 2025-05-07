#----------------------------
# Postgresql Flexible Server
#----------------------------
resource "azurerm_postgresql_flexible_server" "psqlflexibleserver" {
  name                   = var.psqlflexibleserver_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = try(var.psql_version, "15")
  delegated_subnet_id    = try(var.delegated_subnet_id, null)
  private_dns_zone_id    = try(var.private_dns_zone_id, null)
  administrator_login    = try(var.administrator_login, "saitama")
  administrator_password = var.administrator_password
  zone                   = try(var.zone, null)
  storage_mb             = try(var.storage_mb, "32768")
  sku_name               = try(var.sku_name, "B_Standard_B1ms")
  auto_grow_enabled      = try(var.auto_grow_enabled, true)

  identity {
    type         = var.identity.type
    identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
      zone,
      identity
    ]
  }
}