#--------------
# Custom Domain
#--------------
resource "azurerm_cdn_frontdoor_custom_domain" "domain" {
  for_each                 = var.frontdoor_custom_domain
  name                     = each.value.custom_domain_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
  host_name                = each.value.host_name
  tls {
    certificate_type    = try(each.value.certificate_type, "ManagedCertificate")
    minimum_tls_version = try(each.value.minimum_tls_version, "TLS12")
  }
}

#------------------------
# Public DNS CNAME Record
#------------------------
# CNAME Record Resource
resource "azurerm_dns_cname_record" "public_dns_cname_record" {
  for_each            = var.dns_cname_records
  resource_group_name = azurerm_cdn_frontdoor_profile.frontdoor.resource_group_name
  name                = each.value.name
  zone_name           = each.value.zone_name
  ttl                 = each.value.ttl
  record              = azurerm_cdn_frontdoor_endpoint.endpoint[each.value.endpoint].host_name
  tags                = lookup(each.value, "tags", {})

  #This is stated as required in Terraform documents, but is showing as an implicit dependency in the statefile
  #depends_on = [
  #  azurerm_cdn_frontdoor_route.frontdoor[each.value.frontdoor_route],
  #  azurerm_cdn_frontdoor_custom_domain.frontdoor[each.value.domain],
  #  azurerm_cdn_frontdoor_security_policy.frontdoor[each.value.waf_policy]
  #]
}

#----------------------
# Public DNS TXT Record
#----------------------
resource "azurerm_dns_txt_record" "public_dns_txt_record" {
  for_each            = var.dns_txt_records
  resource_group_name = azurerm_cdn_frontdoor_profile.frontdoor.resource_group_name
  name                = join(".", ["_dnsauth", each.value.name])
  zone_name           = each.value.zone_name
  ttl                 = each.value.ttl
  record {
    value = azurerm_cdn_frontdoor_custom_domain.domain[each.value.domain].validation_token
  }
}