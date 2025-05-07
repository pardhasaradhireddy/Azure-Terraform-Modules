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
| [azurerm_monitor_diagnostic_setting.public_ip_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_monitor_diagnostic_categories.public_ip_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | The allocation method for the public IP address (Static or Dynamic). | `string` | `"Static"` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | The domain name label to use for the public IP address. Defaults to null. | `any` | `null` | no |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | A flag to enable or disable diagnostic settings for the public IP address. | `bool` | `true` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | The resource ID of the Log Analytics Workspace to associate with the diagnostic settings. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the public IP will be created. | `any` | `null` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | Specifies the destination type for logs in the Log Analytics Workspace. Defaults to null. | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | The list of log categories to capture for the public IP address diagnostic settings. | `list` | `[]` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | A list of metrics to capture for the public IP address diagnostic settings. | `list` | `[]` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | The name of the public IP address resource. | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the public IP will be created. | `any` | `null` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | The number of days to retain logs and metrics in the diagnostic settings. Defaults to 30. | `number` | `30` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the public IP address (Basic or Standard). | `string` | `"Standard"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The tier of the SKU for the public IP address (e.g., Regional or Global). | `string` | `"Regional"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the public IP address. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the Azure public IP address. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The actual public IP address allocated by Azure. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure public IP address resource. |
