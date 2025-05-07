## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart"></a> [chart](#input\_chart) | (Required) Chart name to be installed. A path may be used | `string` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | (Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed. | `string` | `null` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | (Optional) Create the namespace if it does not exist. Defaults to false. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Release name. The length must not be longer than 53 characters. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) Namespace to install the release into. Defaults to default. | `string` | `"default"` | no |
| <a name="input_replace"></a> [replace](#input\_replace) | (Optional) Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false. | `bool` | `false` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | (Optional) Repository where to locate the requested chart. If is a URL the chart is installed without installing the repository. | `string` | `null` | no |
| <a name="input_set"></a> [set](#input\_set) | (Optional) Custom values to be merged with the values. | `map(string)` | `{}` | no |

## Outputs

No outputs.
