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
| [azurerm_monitor_workspace.monitor_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Azure Monitor Workspace will be created. | `any` | `null` | no |
| <a name="input_monitor_workspace_name"></a> [monitor\_workspace\_name](#input\_monitor\_workspace\_name) | The name of the Azure Monitor Workspace. | `any` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Specifies whether public network access is enabled for the Azure Monitor Workspace. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where the Azure Monitor Workspace will be created. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the Azure Monitor Workspace. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The resource ID of the Azure Monitor Workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure Monitor Workspace. |
