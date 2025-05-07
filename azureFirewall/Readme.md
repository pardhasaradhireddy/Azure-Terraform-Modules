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
| [azurerm_firewall.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |
| [azurerm_firewall_policy.firewall_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy) | resource |
| [azurerm_firewall_policy_rule_collection_group.rule_collection_group_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |
| [azurerm_firewall_policy_rule_collection_group.rule_collection_group_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |
| [azurerm_firewall_policy_rule_collection_group.rule_collection_group_cdp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_policy_rule_collection_group) | resource |
| [azurerm_monitor_diagnostic_setting.firewall_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.firewall_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_rules"></a> [application\_rules](#input\_application\_rules) | Application rules for rule collection group 1. | `any` | n/a | yes |
| <a name="input_application_rules_aks"></a> [application\_rules\_aks](#input\_application\_rules\_aks) | Application rules for rule collection group AKS. | `any` | n/a | yes |
| <a name="input_application_rules_cdp"></a> [application\_rules\_cdp](#input\_application\_rules\_cdp) | Application rules for rule collection group CDP. | `any` | n/a | yes |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | Flag to enable or disable diagnostic settings. | `bool` | `true` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | The name of the Azure Firewall instance. | `string` | n/a | yes |
| <a name="input_firewall_policy_name"></a> [firewall\_policy\_name](#input\_firewall\_policy\_name) | The name of the Azure Firewall Policy. | `string` | n/a | yes |
| <a name="input_fw_apim_ip_configuration_name"></a> [fw\_apim\_ip\_configuration\_name](#input\_fw\_apim\_ip\_configuration\_name) | The name of the API Management (APIM) IP configuration for the firewall. | `string` | n/a | yes |
| <a name="input_fw_apim_prod_ip_configuration_name"></a> [fw\_apim\_prod\_ip\_configuration\_name](#input\_fw\_apim\_prod\_ip\_configuration\_name) | The name of the APIM production IP configuration for the firewall. | `string` | n/a | yes |
| <a name="input_fw_apim_prod_public_ip_address_id"></a> [fw\_apim\_prod\_public\_ip\_address\_id](#input\_fw\_apim\_prod\_public\_ip\_address\_id) | The ID of the public IP address for the APIM production firewall configuration. | `string` | n/a | yes |
| <a name="input_fw_apim_public_ip_address_id"></a> [fw\_apim\_public\_ip\_address\_id](#input\_fw\_apim\_public\_ip\_address\_id) | The ID of the public IP address for the APIM firewall configuration. | `string` | n/a | yes |
| <a name="input_fw_apim_qa_ip_configuration_name"></a> [fw\_apim\_qa\_ip\_configuration\_name](#input\_fw\_apim\_qa\_ip\_configuration\_name) | The name of the APIM QA IP configuration for the firewall. | `string` | n/a | yes |
| <a name="input_fw_apim_qa_public_ip_address_id"></a> [fw\_apim\_qa\_public\_ip\_address\_id](#input\_fw\_apim\_qa\_public\_ip\_address\_id) | The ID of the public IP address for the APIM QA firewall configuration. | `string` | n/a | yes |
| <a name="input_fw_ip_configuration_name"></a> [fw\_ip\_configuration\_name](#input\_fw\_ip\_configuration\_name) | The name of the firewall IP configuration. | `string` | n/a | yes |
| <a name="input_fw_public_ip_address_id"></a> [fw\_public\_ip\_address\_id](#input\_fw\_public\_ip\_address\_id) | The ID of the public IP address associated with the firewall. | `string` | n/a | yes |
| <a name="input_fw_subnet_id"></a> [fw\_subnet\_id](#input\_fw\_subnet\_id) | The ID of the subnet where the firewall is deployed. | `string` | n/a | yes |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | The ID of the Log Analytics workspace. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Firewall Policy will be deployed. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | The destination type for Log Analytics (e.g., AzureMonitor or Storage). | `string` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | List of log categories to enable for diagnostics. | `any` | n/a | yes |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | List of metrics to enable for diagnostics. | `any` | n/a | yes |
| <a name="input_mgmt_ip_configuration_name"></a> [mgmt\_ip\_configuration\_name](#input\_mgmt\_ip\_configuration\_name) | The name of the management IP configuration. | `string` | n/a | yes |
| <a name="input_mgmt_public_ip_address_id"></a> [mgmt\_public\_ip\_address\_id](#input\_mgmt\_public\_ip\_address\_id) | The ID of the public IP address for firewall management. | `string` | n/a | yes |
| <a name="input_mgmt_subnet_id"></a> [mgmt\_subnet\_id](#input\_mgmt\_subnet\_id) | The ID of the management subnet. | `string` | n/a | yes |
| <a name="input_nat_rules"></a> [nat\_rules](#input\_nat\_rules) | NAT rules for rule collection group 1. | `any` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | Network rules for rule collection group 1. | `any` | n/a | yes |
| <a name="input_network_rules_aks"></a> [network\_rules\_aks](#input\_network\_rules\_aks) | Network rules for rule collection group AKS. | `any` | n/a | yes |
| <a name="input_private_ip_ranges"></a> [private\_ip\_ranges](#input\_private\_ip\_ranges) | List of private IP address ranges for the Firewall Policy. | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Firewall Policy will be created. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Number of days to retain logs in Log Analytics. | `number` | `30` | no |
| <a name="input_rule_collection_group_1"></a> [rule\_collection\_group\_1](#input\_rule\_collection\_group\_1) | Configuration for rule collection group 1. | `any` | n/a | yes |
| <a name="input_rule_collection_group_aks"></a> [rule\_collection\_group\_aks](#input\_rule\_collection\_group\_aks) | Configuration for rule collection group AKS. | `any` | n/a | yes |
| <a name="input_rule_collection_group_cdp"></a> [rule\_collection\_group\_cdp](#input\_rule\_collection\_group\_cdp) | Configuration for rule collection group CDP. | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the Azure Firewall instance. | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier for the Firewall Policy (e.g., 'Standard' or 'Premium'). | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Firewall Policy. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Azure Firewall instance. |
| <a name="output_ip_configuration"></a> [ip\_configuration](#output\_ip\_configuration) | The IP configuration details of the Azure Firewall instance. |
| <a name="output_management_ip_configuration"></a> [management\_ip\_configuration](#output\_management\_ip\_configuration) | The management IP configuration details of the Azure Firewall instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure Firewall instance. |
