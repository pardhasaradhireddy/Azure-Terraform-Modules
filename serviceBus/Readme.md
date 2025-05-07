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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_servicebus_queue"></a> [servicebus\_queue](#module\_servicebus\_queue) | ../serviceBusQueue | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.servicebus_ns_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_servicebus_namespace.servicebus_ns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |
| [azurerm_monitor_diagnostic_categories.servicebus_ns_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | (Optional) Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `number` | `null` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | (Optional) An customer\_managed\_key block as defined below. | `any` | `{}` | no |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | --------------------- Diagnostic Settings --------------------- | `bool` | `true` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block as defined below. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | <pre>{<br/>  "identity_ids": [],<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Key Vault ID | `string` | n/a | yes |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | (Optional) Whether or not SAS authentication is enabled for the Service Bus namespace. Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | (Optional) The minimum supported TLS version for this Service Bus Namespace. Valid values are: 1.0, 1.1 and 1.2. Defaults to 1.2. | `number` | `1.2` | no |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | (Optional) An network\_rule\_set block as defined below. | `any` | `{}` | no |
| <a name="input_premium_messaging_partitions"></a> [premium\_messaging\_partitions](#input\_premium\_messaging\_partitions) | (Optional) Specifies the number messaging partitions. Only valid when sku is Premium and the minimum number is 1. Possible values include 0, 1, 2, and 4. Defaults to 0 for Standard, Basic namespace. Changing this forces a new resource to be created. | `number` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is public network access enabled for the Service Bus Namespace? Defaults to true. | `bool` | `true` | no |
| <a name="input_queues"></a> [queues](#input\_queues) | ------------------ ServiceBus Queue ------------------ | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to Changing this forces a new resource to be created. create the namespace. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_servicebus_ns_name"></a> [servicebus\_ns\_name](#input\_servicebus\_ns\_name) | (Required) Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_primary_connection_string"></a> [default\_primary\_connection\_string](#output\_default\_primary\_connection\_string) | The primary connection string for the authorization rule RootManageSharedAccessKey. |
| <a name="output_id"></a> [id](#output\_id) | The ServiceBus Namespace ID. |
| <a name="output_name"></a> [name](#output\_name) | The ServiceBus Namespace Name. |
| <a name="output_servicebus_queue"></a> [servicebus\_queue](#output\_servicebus\_queue) | The ServiceBus Queue |
