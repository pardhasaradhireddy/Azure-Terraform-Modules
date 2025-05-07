## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.116.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.116.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.read_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.write_connection_string](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/key_vault_secret) | resource |
| [azurerm_role_assignment.sb](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/role_assignment) | resource |
| [azurerm_servicebus_queue.servicebus_queue](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/servicebus_queue) | resource |
| [azurerm_servicebus_queue_authorization_rule.read](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/servicebus_queue_authorization_rule) | resource |
| [azurerm_servicebus_queue_authorization_rule.write](https://registry.terraform.io/providers/hashicorp/azurerm/3.116.0/docs/resources/servicebus_queue_authorization_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_delete_on_idle"></a> [auto\_delete\_on\_idle](#input\_auto\_delete\_on\_idle) | (Optional) The ISO 8601 timespan duration of the idle interval after which the Queue is automatically deleted, minimum of 5 minutes. | `bool` | `null` | no |
| <a name="input_batched_operations_enabled"></a> [batched\_operations\_enabled](#input\_batched\_operations\_enabled) | (Optional) Boolean flag which controls whether server-side batched operations are enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_dead_lettering_on_message_expiration"></a> [dead\_lettering\_on\_message\_expiration](#input\_dead\_lettering\_on\_message\_expiration) | (Optional) Boolean flag which controls whether the Queue has dead letter support when a message expires. Defaults to false. | `bool` | `false` | no |
| <a name="input_default_message_ttl"></a> [default\_message\_ttl](#input\_default\_message\_ttl) | (Optional) The ISO 8601 timespan duration of the TTL of messages sent to this queue. This is the default value used when TTL is not set on message itself. | `string` | `null` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate\_detection\_history\_time\_window](#input\_duplicate\_detection\_history\_time\_window) | (Optional) The ISO 8601 timespan duration during which duplicates can be detected. Defaults to 10 minutes (PT10M). | `string` | `"PT10M"` | no |
| <a name="input_enable_partitioning"></a> [enable\_partitioning](#input\_enable\_partitioning) | (Optional) Boolean flag which controls whether to enable the queue to be partitioned across multiple message brokers. Changing this forces a new resource to be created. Defaults to false for Basic and Standard. | `bool` | `false` | no |
| <a name="input_express_enabled"></a> [express\_enabled](#input\_express\_enabled) | (Optional) Boolean flag which controls whether Express Entities are enabled. An express queue holds a message in memory temporarily before writing it to persistent storage. Defaults to false for Basic and Standard. For Premium, it MUST be set to false. | `bool` | `false` | no |
| <a name="input_forward_dead_lettered_messages_to"></a> [forward\_dead\_lettered\_messages\_to](#input\_forward\_dead\_lettered\_messages\_to) | (Optional) The name of a Queue or Topic to automatically forward dead lettered messages to. | `string` | `null` | no |
| <a name="input_forward_to"></a> [forward\_to](#input\_forward\_to) | (Optional) The name of a Queue or Topic to automatically forward messages to. | `string` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | Key Vault ID | `string` | n/a | yes |
| <a name="input_lock_duration"></a> [lock\_duration](#input\_lock\_duration) | (Optional) The ISO 8601 timespan duration of a peek-lock; that is, the amount of time that the message is locked for other receivers. Maximum value is 5 minutes. Defaults to 1 minute (PT1M). | `string` | `"PT1M"` | no |
| <a name="input_max_delivery_count"></a> [max\_delivery\_count](#input\_max\_delivery\_count) | (Optional) Integer value which controls when a message is automatically dead lettered. Defaults to 10. | `number` | `10` | no |
| <a name="input_max_message_size_in_kilobytes"></a> [max\_message\_size\_in\_kilobytes](#input\_max\_message\_size\_in\_kilobytes) | (Optional) Integer value which controls the maximum size of a message allowed on the queue for Premium SKU. | `number` | `null` | no |
| <a name="input_max_size_in_megabytes"></a> [max\_size\_in\_megabytes](#input\_max\_size\_in\_megabytes) | (Optional) Integer value which controls the size of memory allocated for the queue. | `number` | `null` | no |
| <a name="input_rbac_principal_id"></a> [rbac\_principal\_id](#input\_rbac\_principal\_id) | Object Id of the user or application to which access to be provided. | `list(any)` | `[]` | no |
| <a name="input_requires_duplicate_detection"></a> [requires\_duplicate\_detection](#input\_requires\_duplicate\_detection) | (Optional) Boolean flag which controls whether the Queue requires duplicate detection. Changing this forces a new resource to be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_requires_session"></a> [requires\_session](#input\_requires\_session) | (Optional) Boolean flag which controls whether the Queue requires sessions. This will allow ordered handling of unbounded sequences of related messages. With sessions enabled a queue can guarantee first-in-first-out delivery of messages. Changing this forces a new resource to be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | Role Definition Name | `string` | `"Azure Event Hubs Data owner"` | no |
| <a name="input_servicebus_id"></a> [servicebus\_id](#input\_servicebus\_id) | (Required) The ID of the ServiceBus Namespace to create this queue in. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_servicebus_queue_name"></a> [servicebus\_queue\_name](#input\_servicebus\_queue\_name) | (Required) Specifies the name of the ServiceBus Queue resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_status"></a> [status](#input\_status) | (Optional) The status of the Queue. Possible values are Active, Creating, Deleting, Disabled, ReceiveDisabled, Renaming, SendDisabled, Unknown. Note that Restoring is not accepted. Defaults to Active. | `string` | `"Active"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_servicebus_queue_id"></a> [servicebus\_queue\_id](#output\_servicebus\_queue\_id) | The ServiceBus Queue ID. |
| <a name="output_servicebus_queue_name"></a> [servicebus\_queue\_name](#output\_servicebus\_queue\_name) | The ServiceBus Queue Name. |
| <a name="output_servicebus_queue_read_connection_string"></a> [servicebus\_queue\_read\_connection\_string](#output\_servicebus\_queue\_read\_connection\_string) | Read Connection String |
| <a name="output_servicebus_queue_write_connection_string"></a> [servicebus\_queue\_write\_connection\_string](#output\_servicebus\_queue\_write\_connection\_string) | Write Connection String |
