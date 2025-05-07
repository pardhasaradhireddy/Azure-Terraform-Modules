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
| <a name="input_GITHUB-RUNNERS-PAT"></a> [GITHUB-RUNNERS-PAT](#input\_GITHUB-RUNNERS-PAT) | n/a | `any` | n/a | yes |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | (Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed. | `string` | `"0.23.7"` | no |
| <a name="input_github_runners_image_version"></a> [github\_runners\_image\_version](#input\_github\_runners\_image\_version) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
