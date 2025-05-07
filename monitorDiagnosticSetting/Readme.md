## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
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
| [azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled_log"></a> [enabled\_log](#input\_enabled\_log) | A map containing enabled log configurations. Each entry must specify either 'category' or 'category\_group', but not both. | <pre>map(object({<br/>    category       = optional(string)<br/>    category_group = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | (Optional) Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | (Optional) Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | (Optional) Possible values are AzureDiagnostics and Dedicated. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (Optional) Specifies the ID of a Log Analytics Workspace where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_metric"></a> [metric](#input\_metric) | (Optional) One or more metric blocks as defined below. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Diagnostic Setting. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_partner_solution_id"></a> [partner\_solution\_id](#input\_partner\_solution\_id) | (Optional) The ID of the market partner solution where Diagnostics Data should be sent. | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | (Optional) The ID of the Storage Account where logs should be sent. | `string` | `null` | no |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | (Required) The ID of an existing Resource on which to configure Diagnostic Settings. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Diagnostic Setting. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Diagnostic Setting. |
