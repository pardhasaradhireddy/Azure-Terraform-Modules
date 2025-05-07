#-------------------
# Private End Point
#-------------------
resource "azurerm_private_endpoint" "private_endpoint" {
  name                          = var.private_endpoint_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_id
  custom_network_interface_name = try(var.custom_network_interface_name, null)

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = var.private_dns_zone_ids
  }

  private_service_connection {
    name                              = var.private_service_connection_name
    is_manual_connection              = var.is_manual_connection
    private_connection_resource_id    = try(var.private_connection_resource_id, null)
    private_connection_resource_alias = try(var.private_connection_resource_alias, null)
    subresource_names                 = try(var.subresource_names, null)
    request_message                   = try(var.request_message, null)
  }

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
    ]
  }
}