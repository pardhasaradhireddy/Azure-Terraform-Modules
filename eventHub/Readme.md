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
| [azurerm_eventhub.eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.read](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [azurerm_eventhub_authorization_rule.write](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [azurerm_eventhub_consumer_group.consumer_groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_consumer_group) | resource |
| [azurerm_key_vault_secret.read_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.write_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_role_assignment.evh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capture_description"></a> [capture\_description](#input\_capture\_description) | (Optional) A capture\_description block as defined below. | `map` | `{}` | no |
| <a name="input_consumer_group_list"></a> [consumer\_group\_list](#input\_consumer\_group\_list) | Consumer Group List | `list(any)` | `[]` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | (Required) Specifies the name of the EventHub resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_eventhub_namespace"></a> [eventhub\_namespace](#input\_eventhub\_namespace) | (Required) Specifies the name of the EventHub Namespace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_eventhub_rg"></a> [eventhub\_rg](#input\_eventhub\_rg) | (Required) The name of the resource group in which the EventHub's parent Namespace exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | (Required) Key Vault ID. | `string` | n/a | yes |
| <a name="input_message_retention"></a> [message\_retention](#input\_message\_retention) | (Required) Specifies the number of days to retain the events for this Event Hub. | `number` | n/a | yes |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count) | (Required) Specifies the current number of shards on the Event Hub. | `number` | n/a | yes |
| <a name="input_rbac_principal_id"></a> [rbac\_principal\_id](#input\_rbac\_principal\_id) | Object Id of the user or application to which access to be provided. | `list(any)` | `[]` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | role defination name | `string` | `"Azure Event Hubs Data owner"` | no |
| <a name="input_status"></a> [status](#input\_status) | (Optional) Specifies the status of the Event Hub resource. Possible values are Active, Disabled and SendDisabled. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to Key Vault Secrets. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_hub_id"></a> [event\_hub\_id](#output\_event\_hub\_id) | The ID of the EventHub. |
| <a name="output_event_hub_name"></a> [event\_hub\_name](#output\_event\_hub\_name) | The Name of the EventHub. |
| <a name="output_partition_ids"></a> [partition\_ids](#output\_partition\_ids) | The identifiers for partitions created for Event Hubs. |
