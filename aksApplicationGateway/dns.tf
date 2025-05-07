#------------
# DNS Record
#------------
resource "azurerm_private_dns_a_record" "dcp_app_gateway_dns_a_record" {
  provider            = azurerm.hub
  name                = var.dns_record.name
  zone_name           = var.dns_record.dns_zone_name
  resource_group_name = var.dns_record.zone_resource_group
  ttl                 = var.dns_record.dns_a_record_ttl
  records             = [var.private_ip_address]
}