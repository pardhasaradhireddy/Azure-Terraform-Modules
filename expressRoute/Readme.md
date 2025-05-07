## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_express_route_circuit.express_route_circuit](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit) | resource |
| [azurerm_monitor_diagnostic_setting.express_route_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_network_gateway.virtual_network_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.expressroute_vng_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | (Optional) If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_allow_classic_operations"></a> [allow\_classic\_operations](#input\_allow\_classic\_operations) | (Optional) Allow the circuit to interact with classic (RDFE) resources. Defaults to false. | `bool` | `false` | no |
| <a name="input_authorization_key"></a> [authorization\_key](#input\_authorization\_key) | (Optional) The authorization key. This can be used to set up an ExpressRoute Circuit with an ExpressRoute Port from another subscription. | `string` | `null` | no |
| <a name="input_bandwidth_in_gbps"></a> [bandwidth\_in\_gbps](#input\_bandwidth\_in\_gbps) | (Optional) The bandwidth in Gbps of the circuit being created on the Express Route Port. | `string` | `null` | no |
| <a name="input_bandwidth_in_mbps"></a> [bandwidth\_in\_mbps](#input\_bandwidth\_in\_mbps) | (Optional) The bandwidth in Mbps of the circuit being created on the Service Provider. | `string` | `null` | no |
| <a name="input_bgp_route_translation_for_nat_enabled"></a> [bgp\_route\_translation\_for\_nat\_enabled](#input\_bgp\_route\_translation\_for\_nat\_enabled) | (Optional) Is BGP Route Translation for NAT enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_bgp_settings"></a> [bgp\_settings](#input\_bgp\_settings) | (Optional) A bgp\_settings block | `any` | `{}` | no |
| <a name="input_custom_route"></a> [custom\_route](#input\_custom\_route) | (Optional) A custom\_route block | `any` | `{}` | no |
| <a name="input_default_local_network_gateway_id"></a> [default\_local\_network\_gateway\_id](#input\_default\_local\_network\_gateway\_id) | (Optional) The ID of the local network gateway through which outbound Internet traffic from the virtual network in which the gateway is created will be routed (forced tunnelling). Refer to the Azure documentation on forced tunnelling. If not specified, forced tunnelling is disabled. | `string` | `null` | no |
| <a name="input_dns_forwarding_enabled"></a> [dns\_forwarding\_enabled](#input\_dns\_forwarding\_enabled) | (Optional) Is DNS forwarding enabled? | `bool` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. Changing this forces a new Virtual Network Gateway to be created. | `string` | `null` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | (Optional) If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_express_route_circuit_name"></a> [express\_route\_circuit\_name](#input\_express\_route\_circuit\_name) | (Required) The name of the ExpressRoute circuit. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_express_route_diagnostics_name"></a> [express\_route\_diagnostics\_name](#input\_express\_route\_diagnostics\_name) | ------------- Diagnostics ------------- | `any` | n/a | yes |
| <a name="input_express_route_port_id"></a> [express\_route\_port\_id](#input\_express\_route\_port\_id) | (Optional) The ID of the Express Route Port this Express Route Circuit is based on. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_express_route_sku"></a> [express\_route\_sku](#input\_express\_route\_sku) | (Required) A sku block for the ExpressRoute circuit. | `any` | n/a | yes |
| <a name="input_expressroute_vng_connection_name"></a> [expressroute\_vng\_connection\_name](#input\_expressroute\_vng\_connection\_name) | ----------------------------------------- Express Route & VNET Gateway Connection ----------------------------------------- | `any` | n/a | yes |
| <a name="input_gateway_sku"></a> [gateway\_sku](#input\_gateway\_sku) | (Required) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway. | `string` | n/a | yes |
| <a name="input_gateway_type"></a> [gateway\_type](#input\_gateway\_type) | (Required) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_generation"></a> [generation](#input\_generation) | (Optional) The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | (Required) One or more (up to 3) ip\_configuration blocks | `any` | `{}` | no |
| <a name="input_ip_sec_replay_protection_enabled"></a> [ip\_sec\_replay\_protection\_enabled](#input\_ip\_sec\_replay\_protection\_enabled) | (Optional) Is IP Sec Replay Protection enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `any` | n/a | yes |
| <a name="input_peering_location"></a> [peering\_location](#input\_peering\_location) | (Optional) The name of the peering location and not the Azure resource location. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_policy_group"></a> [policy\_group](#input\_policy\_group) | (Optional) One or more policy\_group blocks as defined below. | `any` | `{}` | no |
| <a name="input_private_ip_address_enabled"></a> [private\_ip\_address\_enabled](#input\_private\_ip\_address\_enabled) | (Optional) Should private IP be enabled on this gateway for connections? Changing this forces a new resource to be created. | `bool` | `null` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | n/a | `any` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | ----------- Public IP ----------- | `any` | n/a | yes |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | n/a | `any` | n/a | yes |
| <a name="input_public_ip_sku_tier"></a> [public\_ip\_sku\_tier](#input\_public\_ip\_sku\_tier) | n/a | `any` | n/a | yes |
| <a name="input_remote_vnet_traffic_enabled"></a> [remote\_vnet\_traffic\_enabled](#input\_remote\_vnet\_traffic\_enabled) | (Optional) Is remote vnet traffic that is used to configure this gateway to accept traffic from other Azure Virtual Networks enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the ExpressRoute circuit. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | (Optional) The name of the ExpressRoute Service Provider. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_gateway_name"></a> [virtual\_network\_gateway\_name](#input\_virtual\_network\_gateway\_name) | (Required) The name of the Virtual Network Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_virtual_wan_traffic_enabled"></a> [virtual\_wan\_traffic\_enabled](#input\_virtual\_wan\_traffic\_enabled) | (Optional) Is remote vnet traffic that is used to configure this gateway to accept traffic from remote Virtual WAN networks enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | (Optional) A vpn\_client\_configuration block | `any` | `{}` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | (Optional) The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. Changing this forces a new resource to be created. | `string` | `"RouteBased"` | no |

## Outputs

No outputs.
