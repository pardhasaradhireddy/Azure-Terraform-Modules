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
| [azurerm_log_analytics_workspace.log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_resource_only_permissions"></a> [allow\_resource\_only\_permissions](#input\_allow\_resource\_only\_permissions) | (Optional) Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true. | `bool` | `true` | no |
| <a name="input_cmk_for_query_forced"></a> [cmk\_for\_query\_forced](#input\_cmk\_for\_query\_forced) | (Optional) Is Customer Managed Storage mandatory for query management? | `string` | `null` | no |
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | (Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted. | `number` | `-1` | no |
| <a name="input_data_collection_rule_id"></a> [data\_collection\_rule\_id](#input\_data\_collection\_rule\_id) | (Optional) The ID of the Data Collection Rule to use for this workspace. | `string` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block as defined below. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | <pre>{<br/>  "identity_ids": [],<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_immediate_data_purge_on_30_days_enabled"></a> [immediate\_data\_purge\_on\_30\_days\_enabled](#input\_immediate\_data\_purge\_on\_30\_days\_enabled) | (Optional) Whether to remove the data in the Log Analytics Workspace immediately after 30 days. | `string` | `null` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | (Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to true. | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | (Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to true. | `bool` | `true` | no |
| <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled) | (Optional) Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to false. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_reservation_capacity_in_gb_per_day"></a> [reservation\_capacity\_in\_gb\_per\_day](#input\_reservation\_capacity\_in\_gb\_per\_day) | (Optional) The capacity reservation level in GB for this workspace. Possible values are 100, 200, 300, 400, 500, 1000, 2000 and 5000. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which the Log Analytics workspace is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `string` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018. | `string` | `"PerGB2018"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Log Analytics Workspace ID. |
| <a name="output_name"></a> [name](#output\_name) | The Log Analytics Workspace Name. |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | The Primary shared key for the Log Analytics Workspace. |
| <a name="output_secondary_shared_key"></a> [secondary\_shared\_key](#output\_secondary\_shared\_key) | The Secondary shared key for the Log Analytics Workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The Workspace (or Customer) ID for the Log Analytics Workspace. |
