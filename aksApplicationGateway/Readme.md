## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |
| <a name="provider_azurerm.hub"></a> [azurerm.hub](#provider\_azurerm.hub) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.app_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |
| [azurerm_monitor_diagnostic_setting.app_gateway_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_dns_a_record.dcp_app_gateway_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_monitor_diagnostic_categories.app_gateway_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_app_gateway_name"></a> [aks\_app\_gateway\_name](#input\_aks\_app\_gateway\_name) | The name of the Azure Application Gateway. | `string` | n/a | yes |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The DNS record associated with the Application Gateway. | `any` | n/a | yes |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | --------------------- Diagnostic Settings --------------------- | `bool` | `true` | no |
| <a name="input_firewall_policy_id"></a> [firewall\_policy\_id](#input\_firewall\_policy\_id) | (Optional) The ID of the Web Application Firewall Policy to associate with the Application Gateway. | `string` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | The managed identity configuration for the Application Gateway. | `map` | <pre>{<br/>  "identity_ids": null,<br/>  "type": null<br/>}</pre> | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Application Gateway will be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | The private IP address to assign to the Application Gateway. | `string` | n/a | yes |
| <a name="input_private_ip_allocation"></a> [private\_ip\_allocation](#input\_private\_ip\_allocation) | The allocation method for the private IP address (Static or Dynamic). | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | The public IP configuration for the Application Gateway. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Application Gateway will be deployed. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU (size and tier) of the Application Gateway. | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID where the Application Gateway will be deployed. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Application Gateway resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_app_gateway_id"></a> [aks\_app\_gateway\_id](#output\_aks\_app\_gateway\_id) | The resource ID of the Azure Application Gateway. |
| <a name="output_aks_app_gateway_name"></a> [aks\_app\_gateway\_name](#output\_aks\_app\_gateway\_name) | The name of the Azure Application Gateway associated with the AKS cluster. |
| <a name="output_aks_app_gateway_private_fqdn"></a> [aks\_app\_gateway\_private\_fqdn](#output\_aks\_app\_gateway\_private\_fqdn) | The private fully qualified domain name (FQDN) of the Application Gateway, retrieved from the private DNS A record. |
| <a name="output_aks_app_gateway_rg_name"></a> [aks\_app\_gateway\_rg\_name](#output\_aks\_app\_gateway\_rg\_name) | The name of the resource group containing the Azure Application Gateway. |
