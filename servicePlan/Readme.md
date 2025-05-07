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
| [azurerm_management_lock.management_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) | resource |
| [azurerm_service_plan.service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_environment_id"></a> [app\_service\_environment\_id](#input\_app\_service\_environment\_id) | (Optional) The ID of the App Service Environment to create this Service Plan in. | `string` | `null` | no |
| <a name="input_enable_management_lock"></a> [enable\_management\_lock](#input\_enable\_management\_lock) | ----------------- Management Lock ----------------- | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure Region where the Service Plan should exist. Changing this forces a new Service Plan to be created. | `string` | n/a | yes |
| <a name="input_maximum_elastic_worker_count"></a> [maximum\_elastic\_worker\_count](#input\_maximum\_elastic\_worker\_count) | (Optional) The maximum number of workers to use in an Elastic SKU Plan. Cannot be set unless using an Elastic SKU. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name which should be used for this Service Plan. Changing this forces a new Service Plan to be created. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | (Required) The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_per_site_scaling_enabled"></a> [per\_site\_scaling\_enabled](#input\_per\_site\_scaling\_enabled) | (Optional) Should Per Site Scaling be enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the Service Plan should exist. Changing this forces a new Service Plan to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, I4v2, I5v2, I6v2, P1v2, P2v2, P3v2, P0v3, P1v3, P2v3, P3v3, P1mv3, P2mv3, P3mv3, P4mv3, P5mv3, S1, S2, S3, SHARED, EP1, EP2, EP3, FC1, WS1, WS2, WS3, and Y1. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | (Optional) The number of Workers (instances) to be allocated. | `number` | `1` | no |
| <a name="input_zone_balancing_enabled"></a> [zone\_balancing\_enabled](#input\_zone\_balancing\_enabled) | (Optional) Should the Service Plan balance across Availability Zones in the region. Changing this forces a new resource to be created. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Service Plan. |
| <a name="output_kind"></a> [kind](#output\_kind) | A string representing the Kind of Service Plan. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Service Plan. |
| <a name="output_reserved"></a> [reserved](#output\_reserved) | Whether this is a reserved Service Plan Type. true if os\_type is Linux, otherwise false. |
