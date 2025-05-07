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
| [azurerm_cdn_frontdoor_firewall_policy.front-door-waf-policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the Web Application Firewall Policy. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the WAF Policy will be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the WAF Policy. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the WAF Policy is enabled. | `bool` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | The mode of the WAF Policy (e.g., 'Prevention' or 'Detection'). | `string` | n/a | yes |
| <a name="input_redirect_url"></a> [redirect\_url](#input\_redirect\_url) | The URL to redirect to when a request is blocked. | `string` | n/a | yes |
| <a name="input_custom_block_response_status_code"></a> [custom\_block\_response\_status\_code](#input\_custom\_block\_response\_status\_code) | The status code to return when a request is blocked. | `number` | n/a | yes |
| <a name="input_custom_block_response_body"></a> [custom\_block\_response\_body](#input\_custom\_block\_response\_body) | The custom response body to return when a request is blocked. | `string` | n/a | yes |
| <a name="input_custom_rule"></a> [custom\_rule](#input\_custom\_rule) | Custom rules for the WAF Policy. | `any` | n/a | yes |
| <a name="input_managed_rule"></a> [managed\_rule](#input\_managed\_rule) | Managed rules for the WAF Policy. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the WAF Policy. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Web Application Firewall Policy. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Web Application Firewall Policy. | 