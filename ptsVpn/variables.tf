variable "location" {}

variable "resource_group_name" {}

#-----------
# Public IP
#-----------
variable "public_ip_name" {}

variable "public_ip_allocation_method" {}

variable "public_ip_sku" {}

variable "public_ip_sku_tier" {}

#-------------------------
# Virtual Network Gateway
#-------------------------
variable "virtual_network_gateway_name" {}

variable "virtual_network_gateway_type" {}

variable "virtual_network_gateway_vpn_type" {}

variable "virtual_network_gateway_sku" {}

variable "private_ip_address_allocation" {}

variable "virtual_network_gateway_subnet_id" {}

variable "additional_routes_to_advertise" {}

#--------------------
# Point-to-Site (vpn)
#--------------------
variable "address_space" {}

variable "vpn_auth_types" {}

variable "aad_tenant" {}

variable "aad_audience" {}

variable "aad_issuer" {}

variable "vpn_client_protocols" {}

variable "tags" {}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  default = true
}

variable "law_id" {}

variable "log_analytics_destination_type" {
  default = null
}

variable "log_category_types" {}

variable "metrics" {}

variable "retention_days" {
  default = 30
}