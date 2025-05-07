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
| [azurerm_storage_management_policy.storage_management_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_management_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The ID of the Storage Account where the management policy will be applied. | `string` | n/a | yes |
| <a name="input_rule_name"></a> [rule\_name](#input\_rule\_name) | The name of the management policy rule. | `string` | n/a | yes |
| <a name="input_days_to_cold_storage"></a> [days\_to\_cold\_storage](#input\_days\_to\_cold\_storage) | The number of days after which blobs will be moved to cool storage. | `number` | n/a | yes |
| <a name="input_days_to_deletion"></a> [days\_to\_deletion](#input\_days\_to\_deletion) | The number of days after which blobs will be deleted. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Management Policy. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Storage Management Policy rule. | 