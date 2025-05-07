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
| [azurerm_eventhub_namespace.eventhub_ns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_monitor_diagnostic_setting.eventhub_ns_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.eventhub_ns_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_inflate_enabled"></a> [auto\_inflate\_enabled](#input\_auto\_inflate\_enabled) | (Optional) Is Auto Inflate enabled for the EventHub Namespace? | `bool` | `true` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | (Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis. Defaults to 1. | `string` | `"2"` | no |
| <a name="input_dedicated_cluster_id"></a> [dedicated\_cluster\_id](#input\_dedicated\_cluster\_id) | (Optional) Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | n/a | `bool` | `true` | no |
| <a name="input_eventhub_diagnostics_name"></a> [eventhub\_diagnostics\_name](#input\_eventhub\_diagnostics\_name) | --------------------- Diagnostic Settings --------------------- | `any` | n/a | yes |
| <a name="input_eventhub_ns_name"></a> [eventhub\_ns\_name](#input\_eventhub\_ns\_name) | (Required) Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block | `any` | `{}` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_local_authentication_enabled"></a> [local\_authentication\_enabled](#input\_local\_authentication\_enabled) | (Optional) Is SAS authentication enabled for the EventHub Namespace? Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_maximum_throughput_units"></a> [maximum\_throughput\_units](#input\_maximum\_throughput\_units) | (Optional) Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20. | `string` | `null` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | (Optional) The minimum supported TLS version for this EventHub Namespace. Valid values are: 1.0, 1.1 and 1.2. The current default minimum TLS version is 1.2. | `string` | `"1.2"` | no |
| <a name="input_network_rulesets"></a> [network\_rulesets](#input\_network\_rulesets) | (Optional) A network\_rulesets block as defined below. | `any` | `{}` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is public network access enabled for the EventHub Namespace? Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_primary_connection_string"></a> [default\_primary\_connection\_string](#output\_default\_primary\_connection\_string) | The primary connection string for the authorization rule RootManageSharedAccessKey. |
| <a name="output_default_primary_connection_string_alias"></a> [default\_primary\_connection\_string\_alias](#output\_default\_primary\_connection\_string\_alias) | The alias of the primary connection string for the authorization rule RootManageSharedAccessKey, which is generated when disaster recovery is enabled. |
| <a name="output_default_primary_key"></a> [default\_primary\_key](#output\_default\_primary\_key) | The primary access key for the authorization rule RootManageSharedAccessKey. |
| <a name="output_default_secondary_connection_string"></a> [default\_secondary\_connection\_string](#output\_default\_secondary\_connection\_string) | The secondary connection string for the authorization rule RootManageSharedAccessKey. |
| <a name="output_default_secondary_connection_string_alias"></a> [default\_secondary\_connection\_string\_alias](#output\_default\_secondary\_connection\_string\_alias) | The alias of the secondary connection string for the authorization rule RootManageSharedAccessKey, which is generated when disaster recovery is enabled. |
| <a name="output_default_secondary_key"></a> [default\_secondary\_key](#output\_default\_secondary\_key) | The secondary access key for the authorization rule RootManageSharedAccessKey. |
| <a name="output_id"></a> [id](#output\_id) | The EventHub Namespace ID. |
| <a name="output_identity"></a> [identity](#output\_identity) | An identity block |
| <a name="output_name"></a> [name](#output\_name) | The EventHub Namespace Name. |
