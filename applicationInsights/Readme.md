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
| [azurerm_application_insights.application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_type"></a> [application\_type](#input\_application\_type) | The type of application being monitored. Possible values are 'web', 'other', etc. | `string` | `"web"` | no |
| <a name="input_daily_data_cap_in_gb"></a> [daily\_data\_cap\_in\_gb](#input\_daily\_data\_cap\_in\_gb) | The daily data volume cap in GB. If set, this limits the amount of data ingested per day. | `number` | `null` | no |
| <a name="input_daily_data_cap_notifications_disabled"></a> [daily\_data\_cap\_notifications\_disabled](#input\_daily\_data\_cap\_notifications\_disabled) | Indicates whether notifications for exceeding the daily data cap are disabled. | `bool` | `null` | no |
| <a name="input_disable_ip_masking"></a> [disable\_ip\_masking](#input\_disable\_ip\_masking) | Specifies whether IP masking is disabled. If true, client IP addresses will be stored. | `bool` | `false` | no |
| <a name="input_force_customer_storage_for_profiler"></a> [force\_customer\_storage\_for\_profiler](#input\_force\_customer\_storage\_for\_profiler) | Specifies whether customer-managed storage is required for the profiler feature. | `bool` | `false` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Controls whether ingestion of telemetry data over the public internet is enabled. | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Controls whether queries to Application Insights over the public internet are enabled. | `bool` | `true` | no |
| <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled) | Specifies whether local authentication (instrumentation key-based authentication) is disabled. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Application Insights resource will be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Application Insights resource. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Application Insights resource. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain Application Insights data. | `number` | `365` | no |
| <a name="input_sampling_percentage"></a> [sampling\_percentage](#input\_sampling\_percentage) | The percentage of telemetry data sampled for ingestion, between 0 and 100. | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the Application Insights resource. | `map(string)` | `{}` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | The ID of the Log Analytics workspace to link with Application Insights. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | The unique Application ID associated with Application Insights. |
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | The connection string used to connect to Application Insights for telemetry data ingestion. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Application Insights resource. |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | The instrumentation key used to send telemetry data to Application Insights. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Application Insights resource. |
