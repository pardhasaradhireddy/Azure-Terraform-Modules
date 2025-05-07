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
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | (Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot. | `string` | `"Hot"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | (Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | (Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | (Optional) Allow or disallow nested items within this Account to opt into being public. Defaults to true. | `bool` | `true` | no |
| <a name="input_allowed_copy_scope"></a> [allowed\_copy\_scope](#input\_allowed\_copy\_scope) | (Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink. | `string` | `null` | no |
| <a name="input_azure_files_authentication"></a> [azure\_files\_authentication](#input\_azure\_files\_authentication) | (Optional) A azure\_files\_authentication block as defined below. | `map` | `{}` | no |
| <a name="input_blob_properties"></a> [blob\_properties](#input\_blob\_properties) | (Optional) A blob\_properties block as defined below. | `map` | `{}` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | (Optional) Should cross Tenant replication be enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | (Optional) A custom\_domain block as defined below. | `map` | `{}` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | (Optional) A customer\_managed\_key block as defined below. | `map` | `{}` | no |
| <a name="input_default_to_oauth_authentication"></a> [default\_to\_oauth\_authentication](#input\_default\_to\_oauth\_authentication) | (Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false | `bool` | `false` | no |
| <a name="input_dns_endpoint_type"></a> [dns\_endpoint\_type](#input\_dns\_endpoint\_type) | (Optional) Specifies which DNS endpoint type to use. Possible values are Standard and AzureDnsZone. Defaults to Standard. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created. | `string` | `null` | no |
| <a name="input_https_traffic_only_enabled"></a> [https\_traffic\_only\_enabled](#input\_https\_traffic\_only\_enabled) | (Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true. | `bool` | `true` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block as defined below. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string))<br/>  })</pre> | <pre>{<br/>  "identity_ids": [],<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_immutability_policy"></a> [immutability\_policy](#input\_immutability\_policy) | (Optional) A immutability\_policy block as defined below. | `map` | `{}` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | (Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled) | (Optional) Are Large File Shares Enabled? Defaults to false. | `bool` | `false` | no |
| <a name="input_local_user_enabled"></a> [local\_user\_enabled](#input\_local\_user\_enabled) | (Optional) Is Local User Enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | (Optional) The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2 for new storage accounts. | `string` | `"TLS1_2"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group. | `string` | n/a | yes |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | (Optional) A network\_rules block as defined below. | `map` | `{}` | no |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | (Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Whether the public network access is enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_queue_encryption_key_type"></a> [queue\_encryption\_key\_type](#input\_queue\_encryption\_key\_type) | (Optional) The encryption type of the queue service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service. | `string` | `"Service"` | no |
| <a name="input_queue_properties"></a> [queue\_properties](#input\_queue\_properties) | (Optional) A queue\_properties block as defined below. | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_routing"></a> [routing](#input\_routing) | (Optional) A routing block as defined below. | `map` | `{}` | no |
| <a name="input_sas_policy"></a> [sas\_policy](#input\_sas\_policy) | (Optional) A sas\_policy block as defined below. | `map` | `{}` | no |
| <a name="input_sftp_enabled"></a> [sftp\_enabled](#input\_sftp\_enabled) | (Optional) Boolean, enable SFTP for the storage account | `bool` | `false` | no |
| <a name="input_share_properties"></a> [share\_properties](#input\_share\_properties) | (Optional) A share\_properties block as defined below. | `map` | `{}` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to true. | `bool` | `true` | no |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | (Optional) A static\_website block as defined below. | `map` | `{}` | no |
| <a name="input_table_encryption_key_type"></a> [table\_encryption\_key\_type](#input\_table\_encryption\_key\_type) | (Optional) The encryption type of the table service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the storage account. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity block of the storage account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the storage account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_primary_blob_connection_string"></a> [primary\_blob\_connection\_string](#output\_primary\_blob\_connection\_string) | The primary connection string for the Blob service. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The primary endpoint for the Blob service. |
| <a name="output_primary_blob_host"></a> [primary\_blob\_host](#output\_primary\_blob\_host) | The primary hostname for the Blob service. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | The primary connection string for the storage account. |
| <a name="output_primary_dfs_endpoint"></a> [primary\_dfs\_endpoint](#output\_primary\_dfs\_endpoint) | The primary endpoint for the Data Lake (DFS) service. |
| <a name="output_primary_dfs_host"></a> [primary\_dfs\_host](#output\_primary\_dfs\_host) | The primary hostname for the Data Lake (DFS) service. |
| <a name="output_primary_file_endpoint"></a> [primary\_file\_endpoint](#output\_primary\_file\_endpoint) | The primary endpoint for the File service. |
| <a name="output_primary_file_host"></a> [primary\_file\_host](#output\_primary\_file\_host) | The primary hostname for the File service. |
| <a name="output_primary_location"></a> [primary\_location](#output\_primary\_location) | The primary location of the storage account. |
| <a name="output_primary_queue_endpoint"></a> [primary\_queue\_endpoint](#output\_primary\_queue\_endpoint) | The primary endpoint for the Queue service. |
| <a name="output_primary_table_endpoint"></a> [primary\_table\_endpoint](#output\_primary\_table\_endpoint) | The primary endpoint for the Table service. |
| <a name="output_primary_table_host"></a> [primary\_table\_host](#output\_primary\_table\_host) | The primary hostname for the Table service. |
| <a name="output_primary_web_endpoint"></a> [primary\_web\_endpoint](#output\_primary\_web\_endpoint) | The primary endpoint for the Web service. |
| <a name="output_primary_web_host"></a> [primary\_web\_host](#output\_primary\_web\_host) | The primary hostname for the Web service. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the resource group containing the storage account. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key for the storage account, if geo-redundant storage is enabled. |
| <a name="output_secondary_blob_connection_string"></a> [secondary\_blob\_connection\_string](#output\_secondary\_blob\_connection\_string) | The secondary connection string for the Blob service, if geo-redundant storage is enabled. |
| <a name="output_secondary_blob_endpoint"></a> [secondary\_blob\_endpoint](#output\_secondary\_blob\_endpoint) | The secondary endpoint for the Blob service, if geo-redundant storage is enabled. |
| <a name="output_secondary_blob_host"></a> [secondary\_blob\_host](#output\_secondary\_blob\_host) | The secondary hostname for the Blob service, if geo-redundant storage is enabled. |
| <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string) | The secondary connection string for the storage account, if geo-redundant storage is enabled. |
| <a name="output_secondary_dfs_endpoint"></a> [secondary\_dfs\_endpoint](#output\_secondary\_dfs\_endpoint) | The secondary endpoint for the Data Lake (DFS) service, if geo-redundant storage is enabled. |
| <a name="output_secondary_dfs_host"></a> [secondary\_dfs\_host](#output\_secondary\_dfs\_host) | The secondary hostname for the Data Lake (DFS) service, if geo-redundant storage is enabled. |
| <a name="output_secondary_file_endpoint"></a> [secondary\_file\_endpoint](#output\_secondary\_file\_endpoint) | The secondary endpoint for the File service, if geo-redundant storage is enabled. |
| <a name="output_secondary_file_host"></a> [secondary\_file\_host](#output\_secondary\_file\_host) | The secondary hostname for the File service, if geo-redundant storage is enabled. |
| <a name="output_secondary_location"></a> [secondary\_location](#output\_secondary\_location) | The secondary location of the storage account, if geo-redundant storage is enabled. |
| <a name="output_secondary_queue_endpoint"></a> [secondary\_queue\_endpoint](#output\_secondary\_queue\_endpoint) | The secondary endpoint for the Queue service, if geo-redundant storage is enabled. |
| <a name="output_secondary_queue_host"></a> [secondary\_queue\_host](#output\_secondary\_queue\_host) | The secondary hostname for the Queue service, if geo-redundant storage is enabled. |
| <a name="output_secondary_table_endpoint"></a> [secondary\_table\_endpoint](#output\_secondary\_table\_endpoint) | The secondary endpoint for the Table service, if geo-redundant storage is enabled. |
| <a name="output_secondary_table_host"></a> [secondary\_table\_host](#output\_secondary\_table\_host) | The secondary hostname for the Table service, if geo-redundant storage is enabled. |
| <a name="output_secondary_web_endpoint"></a> [secondary\_web\_endpoint](#output\_secondary\_web\_endpoint) | The secondary endpoint for the Web service, if geo-redundant storage is enabled. |
| <a name="output_secondary_web_host"></a> [secondary\_web\_host](#output\_secondary\_web\_host) | The secondary hostname for the Web service, if geo-redundant storage is enabled. |
