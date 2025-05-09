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
| [azurerm_cdn_frontdoor_custom_domain.domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_custom_domain) | resource |
| [azurerm_cdn_frontdoor_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |
| [azurerm_cdn_frontdoor_origin.origin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_origin_group.origin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_route.frontdoor_route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_route) | resource |
| [azurerm_cdn_frontdoor_rule_set.rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |
| [azurerm_cdn_frontdoor_security_policy.waf_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_security_policy) | resource |
| [azurerm_dns_cname_record.public_dns_cname_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_txt_record.public_dns_txt_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_monitor_diagnostic_setting.frontdoor_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_cdn_frontdoor_firewall_policy.waf_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/cdn_frontdoor_firewall_policy) | data source |
| [azurerm_monitor_diagnostic_categories.frontdoor_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_cname_records"></a> [dns\_cname\_records](#input\_dns\_cname\_records) | (Optional) A map of DNS Cname Records used in the DNS zone | `any` | `{}` | no |
| <a name="input_dns_txt_records"></a> [dns\_txt\_records](#input\_dns\_txt\_records) | (Optional) A map of DNS TXT Records used in the DNS zone | `any` | `{}` | no |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | --------------------- Diagnostic Settings --------------------- | `bool` | `true` | no |
| <a name="input_frontdoor_custom_domain"></a> [frontdoor\_custom\_domain](#input\_frontdoor\_custom\_domain) | (Optional) A map of the custom domains to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_endpoint"></a> [frontdoor\_endpoint](#input\_frontdoor\_endpoint) | (Optional) A map of the endpoints to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_name"></a> [frontdoor\_name](#input\_frontdoor\_name) | (Required) Specifies the name of the Front Door Profile. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_frontdoor_origin"></a> [frontdoor\_origin](#input\_frontdoor\_origin) | (Optional) A map of the origins to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_origin_group"></a> [frontdoor\_origin\_group](#input\_frontdoor\_origin\_group) | (Optional) A map of the origin groups to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_route"></a> [frontdoor\_route](#input\_frontdoor\_route) | (Optional) A map of the routes to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_security_policy"></a> [frontdoor\_security\_policy](#input\_frontdoor\_security\_policy) | (Optional) A map of the security policies to be created in Front Door | `any` | `{}` | no |
| <a name="input_frontdoor_sku_name"></a> [frontdoor\_sku\_name](#input\_frontdoor\_sku\_name) | (Required) Specifies the SKU for this Front Door Profile. Possible values include Standard\_AzureFrontDoor and Premium\_AzureFrontDoor. Changing this forces a new resource to be created. | `any` | `"Standard_AzureFrontDoor"` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where this Front Door Profile should exist. Changing this forces a new resource to be created. | `any` | `{}` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_rule_set"></a> [rule\_set](#input\_rule\_set) | (Optional) A map of the rule sets to be created in Front Door | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
