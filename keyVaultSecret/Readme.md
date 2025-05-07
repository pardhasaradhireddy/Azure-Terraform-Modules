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
| [azurerm_key_vault_secret.secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_type"></a> [content\_type](#input\_content\_type) | The content type of the Key Vault secret, providing metadata about the secret's value. | `string` | `null` | no |
| <a name="input_expiration_date"></a> [expiration\_date](#input\_expiration\_date) | The expiration date of the secret in RFC3339 format (e.g., '2023-12-31T23:59:59Z'). If not set, the secret does not expire. | `string` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The resource ID of the Key Vault where the secret will be stored. | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | The name of the Key Vault secret. | `string` | n/a | yes |
| <a name="input_secret_value"></a> [secret\_value](#input\_secret\_value) | The value of the Key Vault secret. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Key Vault secret. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The full resource ID of the Key Vault secret. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Key Vault secret. |
| <a name="output_value"></a> [value](#output\_value) | The value of the Key Vault secret (sensitive). |
