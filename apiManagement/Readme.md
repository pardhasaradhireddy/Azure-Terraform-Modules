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
| [azurerm_api_management.api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_api_management_diagnostic.api_management_diagnostic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_diagnostic) | resource |
| [azurerm_api_management_logger.api_management_logger](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_logger) | resource |
| [azurerm_api_management_policy.api_management_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_always_log_errors"></a> [always\_log\_errors](#input\_always\_log\_errors) | Whether to always log errors in API Management diagnostics. | `bool` | n/a | yes |
| <a name="input_api_management_logger_name"></a> [api\_management\_logger\_name](#input\_api\_management\_logger\_name) | The name of the API Management Logger. | `string` | n/a | yes |
| <a name="input_api_management_name"></a> [api\_management\_name](#input\_api\_management\_name) | The name of the API Management service. | `string` | n/a | yes |
| <a name="input_http_correlation_protocol"></a> [http\_correlation\_protocol](#input\_http\_correlation\_protocol) | The HTTP correlation protocol used for API Management diagnostics (e.g., 'Legacy', 'W3C'). | `string` | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | The managed identity configuration for API Management. | <pre>object({<br/>    identity_ids = list(string)<br/>    type         = string<br/>  })</pre> | <pre>{<br/>  "identity_ids": null,<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_instrumentation_key"></a> [instrumentation\_key](#input\_instrumentation\_key) | The instrumentation key for Application Insights logging. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the API Management service is deployed. | `string` | n/a | yes |
| <a name="input_log_client_ip"></a> [log\_client\_ip](#input\_log\_client\_ip) | Whether to log the client IP address in API Management diagnostics. | `bool` | n/a | yes |
| <a name="input_min_api_version"></a> [min\_api\_version](#input\_min\_api\_version) | The minimum API version supported by the API Management service. | `string` | `"2019-12-01"` | no |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | The email address of the API Management publisher. | `string` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | The name of the API Management publisher. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the API Management service is deployed. | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | The resource ID of the destination for API logs (e.g., Log Analytics workspace or Event Hub). | `string` | n/a | yes |
| <a name="input_sampling_percentage"></a> [sampling\_percentage](#input\_sampling\_percentage) | The percentage of requests to sample for diagnostic logging. | `number` | n/a | yes |
| <a name="input_security"></a> [security](#input\_security) | The security settings for the API Management service. | `map(any)` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU of the API Management service (e.g., Developer, Basic, Standard, Premium). | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the API Management service. | `map(string)` | n/a | yes |
| <a name="input_verbosity"></a> [verbosity](#input\_verbosity) | The verbosity level of API Management diagnostics (e.g., 'verbose', 'information', 'error'). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the API Management service. |
| <a name="output_logger_id"></a> [logger\_id](#output\_logger\_id) | The resource ID of the API Management Logger. |
| <a name="output_name"></a> [name](#output\_name) | The name of the API Management service. |
| <a name="output_portal_url"></a> [portal\_url](#output\_portal\_url) | The developer portal URL of the API Management service. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group containing the API Management service. |
