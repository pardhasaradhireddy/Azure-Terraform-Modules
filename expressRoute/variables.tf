variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

#---------------
# Express Route
#---------------
variable "express_route_circuit_name" {
  description = "(Required) The name of the ExpressRoute circuit. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the ExpressRoute circuit. Changing this forces a new resource to be created."
  type        = string
}

variable "express_route_circuit_location" {
  description = "(Required) Specifies the supported Azure location where the ExpressRoute circuit exists. Changing this forces a new resource to be created."
  type        = string
}

variable "express_route_sku" {
  description = "(Required) A sku block for the ExpressRoute circuit."
  type        = any
}

variable "service_provider_name" {
  description = "(Optional) The name of the ExpressRoute Service Provider. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "peering_location" {
  description = "(Optional) The name of the peering location and not the Azure resource location. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "bandwidth_in_mbps" {
  description = "(Optional) The bandwidth in Mbps of the circuit being created on the Service Provider."
  type        = string
  default     = null
}

variable "allow_classic_operations" {
  description = "(Optional) Allow the circuit to interact with classic (RDFE) resources. Defaults to false."
  type        = bool
  default     = false
}

variable "express_route_port_id" {
  description = "(Optional) The ID of the Express Route Port this Express Route Circuit is based on. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "bandwidth_in_gbps" {
  description = "(Optional) The bandwidth in Gbps of the circuit being created on the Express Route Port."
  type        = string
  default     = null
}

variable "authorization_key" {
  description = "(Optional) The authorization key. This can be used to set up an ExpressRoute Circuit with an ExpressRoute Port from another subscription."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

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
variable "virtual_network_gateway_name" {
  description = "(Required) The name of the Virtual Network Gateway. Changing this forces a new resource to be created."
  type        = string
}

variable "gateway_sku" {
  description = "(Required) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway."
  type        = string
}

variable "gateway_type" {
  description = "(Required) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
  type        = string
}

variable "active_active" {
  description = "(Optional) If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false."
  type        = bool
  default     = false
}

variable "default_local_network_gateway_id" {
  description = "(Optional) The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling). Refer to the Azure documentation on forced tunnelling. If not specified, forced tunnelling is disabled."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. Changing this forces a new Virtual Network Gateway to be created."
  type        = string
  default     = null
}

variable "enable_bgp" {
  description = "(Optional) If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  type        = bool
  default     = false
}

variable "ip_configuration" {
  description = "(Required) One or more (up to 3) ip_configuration blocks"
  type        = any
  default     = {}
}

variable "bgp_settings" {
  description = "(Optional) A bgp_settings block"
  type        = any
  default     = {}
}

variable "custom_route" {
  description = "(Optional) A custom_route block"
  type        = any
  default     = {}
}

variable "generation" {
  description = "(Optional) The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "private_ip_address_enabled" {
  description = "(Optional) Should private IP be enabled on this gateway for connections? Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "bgp_route_translation_for_nat_enabled" {
  description = "(Optional) Is BGP Route Translation for NAT enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "dns_forwarding_enabled" {
  description = "(Optional) Is DNS forwarding enabled?"
  type        = bool
  default     = null
}

variable "ip_sec_replay_protection_enabled" {
  description = "(Optional) Is IP Sec Replay Protection enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "policy_group" {
  description = "(Optional) One or more policy_group blocks as defined below."
  type        = any
  default     = {}
}

variable "remote_vnet_traffic_enabled" {
  description = "(Optional) Is remote vnet traffic that is used to configure this gateway to accept traffic from other Azure Virtual Networks enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "virtual_wan_traffic_enabled" {
  description = "(Optional) Is remote vnet traffic that is used to configure this gateway to accept traffic from remote Virtual WAN networks enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "vpn_client_configuration" {
  description = "(Optional) A vpn_client_configuration block"
  type        = any
  default     = {}
}

variable "vpn_type" {
  description = "(Optional) The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. Changing this forces a new resource to be created."
  type        = string
  default     = "RouteBased"
}

#-------------
# Diagnostics
#-------------
variable "express_route_diagnostics_name" {}

variable "log_analytics_workspace_id" {}

#-----------------------------------------
# Express Route & VNET Gateway Connection
#-----------------------------------------
variable "expressroute_vng_connection_name" {}