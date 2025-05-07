## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_dns_a_record.public_dns_a_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_cname_record.public_dns_cname_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_txt_record.public_dns_txt_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_dns_zone.public_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_records"></a> [dns\_a\_records](#input\_dns\_a\_records) | (Optional) A map of DNS A Records used in the DNS zone | `any` | `{}` | no |
| <a name="input_dns_cname_records"></a> [dns\_cname\_records](#input\_dns\_cname\_records) | (Optional) A map of DNS Cname Records used in the DNS zone | `any` | `{}` | no |
| <a name="input_dns_txt_records"></a> [dns\_txt\_records](#input\_dns\_txt\_records) | (Optional) A map of DNS TXT Records used in the DNS zone | `any` | `{}` | no |
| <a name="input_public_dns_zone_name"></a> [public\_dns\_zone\_name](#input\_public\_dns\_zone\_name) | (Required) The name of the DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | map of tags for resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_dns_zone"></a> [public\_dns\_zone](#output\_public\_dns\_zone) | The Name of the Public DNS Zone. |
