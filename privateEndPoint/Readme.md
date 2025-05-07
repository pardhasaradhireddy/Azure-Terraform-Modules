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
| [azurerm_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="private_endpoint_name"></a> [private\_endpoint\_name](#private\_endpoint\_name) | (Required) Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="resource_group_name"></a> [resource\_group\_name](#resource\_group\_name) | (Required) Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="location"></a> [location](#location) | (Required) The supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="subnet_id"></a> [subnet\_id](#subnet\_id) | (Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="custom_network_interface"></a> [custom\_network\_interface](#custom\_network\_interface) | (Optional) The custom name of the network interface attached to the private endpoint. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="private_service_connection_name"></a> [private\_service\_connection\_name](#private\_service\_connection\_name) | (Required) Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="is_manual_connection"></a> [is\_manual\_connection](#is\_manual\_connection) | (Required) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| <a name="private_connection_resource_id"></a> [private\_connection\_resource\_id](#private\_connection\_resource\_id) | (Optional) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself. | `string` | `null` | no |
| <a name="private_connection_resource_alias"></a> [private\_connection\_resource\_alias](#private\_connection\_resource\_alias) | (Optional) The Service Alias of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="subresource_names"></a> [subresource\_names](#subresource\_names) | (Optional) A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id. Possible values are detailed in the product documentation in the Subresources column. Changing this forces a new resource to be created.  | `list(string)` | `null` | no |
| <a name="request_message"></a> [request\_message](#request\_message) | (Optional) A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource. The provider allows a maximum request message length of 140 characters, however the request message maximum length is dependent on the service the private endpoint is connected to. Only valid if is_manual_connection is set to true.  | `string` | `null` | no |
| <a name="tags"></a> [tags](#tags) | (Optional)  (Optional) A mapping of tags to assign to the resource. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|