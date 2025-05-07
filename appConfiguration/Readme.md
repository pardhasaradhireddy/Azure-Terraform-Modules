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
| [azurerm_app_configuration.app_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_configuration) | resource |
| [azurerm_monitor_diagnostic_setting.app_configuration_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.app_configuration_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | --------------------- Diagnostic Settings --------------------- | `bool` | `true` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the resources will be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the application. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create resources. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to resources. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_configuration_endpoint"></a> [app\_configuration\_endpoint](#output\_app\_configuration\_endpoint) | The endpoint URL of the App Configuration resource. |
| <a name="output_app_configuration_id"></a> [app\_configuration\_id](#output\_app\_configuration\_id) | The ID of the App Configuration resource. |
| <a name="output_app_configuration_name"></a> [app\_configuration\_name](#output\_app\_configuration\_name) | The name of the App Configuration resource. |
