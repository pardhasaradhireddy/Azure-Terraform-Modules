#-------------
# Private DNS
#-------------
resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}

#---------------
# DNS VNET Link
#---------------
resource "azurerm_private_dns_zone_virtual_network_link" "dns_vnet_link" {
  for_each              = { for vnet_id in var.virtual_network_ids : vnet_id.name => vnet_id }
  name                  = each.value.name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = each.value.vnet_id
  registration_enabled  = lookup(each.value, "auto_registration", false)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}