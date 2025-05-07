#-----------------
# Public DNS Zone
#-----------------
resource "azurerm_dns_zone" "public_dns_zone" {
  name                = var.public_dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

#---------------------
# Public DNS A Record
#---------------------
resource "azurerm_dns_a_record" "public_dns_a_record" {
  for_each            = var.dns_a_records
  resource_group_name = azurerm_dns_zone.public_dns_zone.resource_group_name
  name                = each.value.name
  zone_name           = azurerm_dns_zone.public_dns_zone.name
  ttl                 = each.value.ttl
  records             = lookup(each.value, "records", [])
  target_resource_id  = lookup(each.value, "target_resource_id", null)
  tags                = lookup(each.value, "tags", {})
}

#-------------------------
# Public DNS CNAME Record
#-------------------------
resource "azurerm_dns_cname_record" "public_dns_cname_record" {
  for_each            = var.dns_cname_records
  resource_group_name = azurerm_dns_zone.public_dns_zone.resource_group_name
  name                = each.value.name
  zone_name           = azurerm_dns_zone.public_dns_zone.name
  ttl                 = each.value.ttl
  record              = lookup(each.value, "record", null)
  target_resource_id  = lookup(each.value, "target_resource_id", null)
  tags                = lookup(each.value, "tags", {})
}

#-----------------------
# Public DNS TXT Record
#-----------------------
resource "azurerm_dns_txt_record" "public_dns_txt_record" {
  for_each            = var.dns_txt_records
  resource_group_name = azurerm_dns_zone.public_dns_zone.resource_group_name
  name                = each.value.name
  zone_name           = azurerm_dns_zone.public_dns_zone.name
  ttl                 = each.value.ttl
  dynamic "record" {
    for_each = length(keys(lookup(each.value, "record", {}))) > 0 ? lookup(each.value, "record", {}) : {}
    content {
      value = record.value
    }
  }
  tags = lookup(each.value, "tags", {})
}

resource "azurerm_dns_ns_record" "public_dns_ns_record" {
  for_each            = var.dns_ns_records
  name                = each.value.name
  zone_name           = azurerm_dns_zone.public_dns_zone.name
  resource_group_name = azurerm_dns_zone.public_dns_zone.resource_group_name
  ttl                 = each.value.ttl
  records             = each.value.records
  tags                = lookup(each.value, "tags", {})
}