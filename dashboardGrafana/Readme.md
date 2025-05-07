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
| [azurerm_dashboard_grafana.dashboard_grafana](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dashboard_grafana) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_enabled"></a> [api\_key\_enabled](#input\_api\_key\_enabled) | Specifies whether API key authentication is enabled for the Grafana dashboard. | `bool` | `true` | no |
| <a name="input_auto_generated_domain_name_label_scope"></a> [auto\_generated\_domain\_name\_label\_scope](#input\_auto\_generated\_domain\_name\_label\_scope) | Specifies the scope for the auto-generated domain name label. Options are 'TenantReuse' or 'Subscription'. | `string` | `"TenantReuse"` | no |
| <a name="input_azure_monitor_workspace_integrations"></a> [azure\_monitor\_workspace\_integrations](#input\_azure\_monitor\_workspace\_integrations) | Specifies the Azure Monitor workspace integrations for the Grafana dashboard. Set to `null` if no integration is required. | `any` | `null` | no |
| <a name="input_dashboard_grafana_name"></a> [dashboard\_grafana\_name](#input\_dashboard\_grafana\_name) | The name of the Grafana dashboard to be created. | `string` | n/a | yes |
| <a name="input_deterministic_outbound_ip_enabled"></a> [deterministic\_outbound\_ip\_enabled](#input\_deterministic\_outbound\_ip\_enabled) | Specifies whether deterministic outbound IP addresses are enabled for the Grafana dashboard. | `bool` | `false` | no |
| <a name="input_grafana_major_version"></a> [grafana\_major\_version](#input\_grafana\_major\_version) | The major version of Grafana to deploy. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Grafana dashboard will be deployed. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Specifies whether public network access is enabled for the Grafana dashboard. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Grafana dashboard. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The pricing tier for the Grafana dashboard. Options include 'Standard' and 'Free'. | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Grafana dashboard for resource categorization and tracking. | `map(string)` | n/a | yes |
| <a name="input_zone_redundancy_enabled"></a> [zone\_redundancy\_enabled](#input\_zone\_redundancy\_enabled) | Specifies whether zone redundancy is enabled for the Grafana dashboard for high availability. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint URL of the Grafana dashboard, used to access the dashboard interface. |
| <a name="output_grafana_version"></a> [grafana\_version](#output\_grafana\_version) | The version of Grafana used by the dashboard. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the Grafana dashboard. |
| <a name="output_identity"></a> [identity](#output\_identity) | The managed identity assigned to the Grafana dashboard for secure access to other resources. |
| <a name="output_outbound_ip"></a> [outbound\_ip](#output\_outbound\_ip) | The outbound IP addresses used by the Grafana dashboard for network communication. |
