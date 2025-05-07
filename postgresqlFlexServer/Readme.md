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
| [azurerm_postgresql_flexible_server.psqlflexibleserver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the PostgreSQL Flexible Server. | `string` | `"saitama"` | no |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | The administrator password for the PostgreSQL Flexible Server. | `string` | `null` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Determines whether auto-grow is enabled for storage on the PostgreSQL Flexible Server. | `bool` | `true` | no |
| <a name="input_delegated_subnet_id"></a> [delegated\_subnet\_id](#input\_delegated\_subnet\_id) | The resource ID of the delegated subnet for the PostgreSQL Flexible Server. | `string` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | The managed identity configuration for the PostgreSQL Flexible Server. | <pre>object({<br/>    identity_ids = list(string)<br/>    type         = string<br/>  })</pre> | <pre>{<br/>  "identity_ids": null,<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the PostgreSQL Flexible Server will be created. | `string` | `null` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The resource ID of the private DNS zone to associate with the PostgreSQL Flexible Server. | `string` | `null` | no |
| <a name="input_psql_version"></a> [psql\_version](#input\_psql\_version) | The version of PostgreSQL to use for the Flexible Server. | `string` | `"15"` | no |
| <a name="input_psqlflexibleserver_name"></a> [psqlflexibleserver\_name](#input\_psqlflexibleserver\_name) | The name of the PostgreSQL Flexible Server instance. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the PostgreSQL Flexible Server will be created. | `string` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the PostgreSQL Flexible Server instance. | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | The maximum storage size in megabytes for the PostgreSQL Flexible Server. | `string` | `"32768"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the PostgreSQL Flexible Server resource. | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The availability zone to deploy the PostgreSQL Flexible Server in. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The fully qualified domain name (FQDN) of the PostgreSQL Flexible Server instance. |
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the PostgreSQL Flexible Server instance. |
| <a name="output_public_network_access_enabled"></a> [public\_network\_access\_enabled](#output\_public\_network\_access\_enabled) | Indicates whether public network access is enabled for the PostgreSQL Flexible Server instance. |
