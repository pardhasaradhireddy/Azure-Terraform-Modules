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
| [azurerm_linux_function_app.linux_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_management_lock.management_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | (Optional) A map of key-value pairs for App Settings and custom values. | `map` | `{}` | no |
| <a name="input_auth_settings"></a> [auth\_settings](#input\_auth\_settings) | (Optional) A auth\_settings block as defined below. | `map` | `{}` | no |
| <a name="input_auth_settings_v2"></a> [auth\_settings\_v2](#input\_auth\_settings\_v2) | (Optional) A auth\_settings\_v2 block as defined below. | `map` | `{}` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | (Optional) A backup block as defined below. | `map` | `{}` | no |
| <a name="input_builtin_logging_enabled"></a> [builtin\_logging\_enabled](#input\_builtin\_logging\_enabled) | (Optional) Should built in logging be enabled. Configures AzureWebJobsDashboard app setting based on the configured storage setting. Defaults to true. | `bool` | `true` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | (Optional) Should the function app use Client Certificates. | `bool` | `null` | no |
| <a name="input_client_certificate_exclusion_paths"></a> [client\_certificate\_exclusion\_paths](#input\_client\_certificate\_exclusion\_paths) | (Optional) Paths to exclude when using client certificates, separated by ; | `any` | `null` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | (Optional) The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required, Optional, and OptionalInteractiveUser. Defaults to Optional. | `string` | `"Optional"` | no |
| <a name="input_connection_string"></a> [connection\_string](#input\_connection\_string) | (Optional) One or more connection\_string blocks as defined below. | `map` | `{}` | no |
| <a name="input_content_share_force_disabled"></a> [content\_share\_force\_disabled](#input\_content\_share\_force\_disabled) | (Optional) Should the settings for linking the Function App to storage be suppressed. | `bool` | `null` | no |
| <a name="input_daily_memory_time_quota"></a> [daily\_memory\_time\_quota](#input\_daily\_memory\_time\_quota) | (Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan. Defaults to 0. | `number` | `"0"` | no |
| <a name="input_enable_management_lock"></a> [enable\_management\_lock](#input\_enable\_management\_lock) | (Optional) Should the Linux Function App Management Lock be enabled? Defaults to false | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Optional) Is the Function App enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_ftp_publish_basic_authentication_enabled"></a> [ftp\_publish\_basic\_authentication\_enabled](#input\_ftp\_publish\_basic\_authentication\_enabled) | (Optional) Should the default FTP Basic Authentication publishing profile be enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_functions_extension_version"></a> [functions\_extension\_version](#input\_functions\_extension\_version) | (Optional) The runtime version associated with the Function App. Defaults to ~4. | `any` | `"~4"` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | (Optional) Can the Function App only be accessed via HTTPS? Defaults to false. | `bool` | `false` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block as defined below. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | <pre>{<br/>  "identity_ids": [],<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_key_vault_reference_identity_id"></a> [key\_vault\_reference\_identity\_id](#input\_key\_vault\_reference\_identity\_id) | (Optional) The User Assigned Identity ID used for accessing KeyVault secrets. The identity must be assigned to the application in the identity block. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Linux Function App should exist. Changing this forces a new Linux Function App to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name which should be used for this Linux Function App. Changing this forces a new Linux Function App to be created. Limit the function name to 32 characters to avoid naming collisions. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Should public network access be enabled for the Function App. Defaults to true. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the Linux Function App should exist. Changing this forces a new Linux Function App to be created. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | (Required) The ID of the App Service Plan within which to create this Function App. | `string` | n/a | yes |
| <a name="input_site_config"></a> [site\_config](#input\_site\_config) | (Required) A site\_config block as defined below. | `any` | n/a | yes |
| <a name="input_sticky_settings"></a> [sticky\_settings](#input\_sticky\_settings) | (Optional) A sticky\_settings block as defined below. | `map` | `{}` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | (Optional) One or more storage\_account blocks as defined below. | `map` | `{}` | no |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | (Optional) The access key which will be used to access the backend storage account for the Function App. Conflicts with storage\_uses\_managed\_identity. | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | (Optional) The backend storage account name which will be used by this Function App. | `string` | `null` | no |
| <a name="input_storage_key_vault_secret_id"></a> [storage\_key\_vault\_secret\_id](#input\_storage\_key\_vault\_secret\_id) | (Optional) The Key Vault Secret ID, optionally including version, that contains the Connection String to connect to the storage account for this Function App. | `string` | `null` | no |
| <a name="input_storage_uses_managed_identity"></a> [storage\_uses\_managed\_identity](#input\_storage\_uses\_managed\_identity) | (Optional) Should the Function App use Managed Identity to access the storage account. Conflicts with storage\_account\_access\_key. | `bool` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Linux Function App. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_id"></a> [virtual\_network\_subnet\_id](#input\_virtual\_network\_subnet\_id) | (Optional) The subnet id which will be used by this Function App for regional virtual network integration. | `string` | `null` | no |
| <a name="input_webdeploy_publish_basic_authentication_enabled"></a> [webdeploy\_publish\_basic\_authentication\_enabled](#input\_webdeploy\_publish\_basic\_authentication\_enabled) | (Optional) Should the default WebDeploy Basic Authentication publishing credentials enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_zip_deploy_file"></a> [zip\_deploy\_file](#input\_zip\_deploy\_file) | (Optional) The local path and filename of the Zip packaged application to deploy to this Linux Function App. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_domain_verification_id"></a> [custom\_domain\_verification\_id](#output\_custom\_domain\_verification\_id) | The identifier used by App Service to perform domain ownership verification via DNS TXT record. |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname of the Linux Function App. |
| <a name="output_hosting_environment_id"></a> [hosting\_environment\_id](#output\_hosting\_environment\_id) | The ID of the App Service Environment used by Function App. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Linux Function App. |
| <a name="output_identity"></a> [identity](#output\_identity) | An identity block |
| <a name="output_kind"></a> [kind](#output\_kind) | The Kind value for this Linux Function App. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Linux Function App. |
| <a name="output_outbound_ip_address_list"></a> [outbound\_ip\_address\_list](#output\_outbound\_ip\_address\_list) | A list of outbound IP addresses. For example ['52.23.25.3', '52.143.43.12'] |
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | A comma separated list of outbound IP addresses as a string. For example 52.23.25.3,52.143.43.12. |
| <a name="output_possible_outbound_ip_address_list"></a> [possible\_outbound\_ip\_address\_list](#output\_possible\_outbound\_ip\_address\_list) | A list of possible outbound IP addresses, not all of which are necessarily in use. This is a superset of outbound\_ip\_address\_list. For example ['52.23.25.3', '52.143.43.12']. |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | A comma separated list of possible outbound IP addresses as a string. For example 52.23.25.3,52.143.43.12,52.143.43.17. This is a superset of outbound\_ip\_addresses. |
| <a name="output_site_credential"></a> [site\_credential](#output\_site\_credential) | A site\_credential block |
