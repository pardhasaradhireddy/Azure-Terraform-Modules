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
| [azurerm_data_protection_backup_instance_kubernetes_cluster.backup_instance](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_instance_kubernetes_cluster) | resource |
| [azurerm_data_protection_backup_policy_kubernetes_cluster.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_policy_kubernetes_cluster) | resource |
| [azurerm_data_protection_backup_vault.backup_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_protection_backup_vault) | resource |
| [azurerm_kubernetes_cluster.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_extension.backup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension) | resource |
| [azurerm_kubernetes_cluster_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension) | resource |
| [azurerm_kubernetes_cluster_node_pool.k8s_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_kubernetes_cluster_trusted_access_role_binding.aks_cluster_trusted_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_trusted_access_role_binding) | resource |
| [azurerm_monitor_diagnostic_setting.k8s_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_role_assignment.extension_and_storage_account_permission](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.mi_to_aks_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsg_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nsg_access_nodepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rt_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.subnet_access](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.subnet_access_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.subnet_access_identity_nodepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.vault_data_operator_on_snap_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.vault_msi_read_on_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.vault_msi_read_on_snap_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.vault_msi_snapshot_contributor_on_snap_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_monitor_diagnostic_categories.k8s_diagnostic_categories](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |
| [azurerm_resource_group.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aci_connector_linux"></a> [aci\_connector\_linux](#input\_aci\_connector\_linux) | (Optional) A aci\_connector\_linux block as defined below. | `any` | `{}` | no |
| <a name="input_admin_group_object_ids"></a> [admin\_group\_object\_ids](#input\_admin\_group\_object\_ids) | (Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster. | `list(string)` | `[]` | no |
| <a name="input_aks_cluster_name"></a> [aks\_cluster\_name](#input\_aks\_cluster\_name) | (Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_api_server_access_profile"></a> [api\_server\_access\_profile](#input\_api\_server\_access\_profile) | (Optional) An api\_server\_access\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_auto_scaler_profile"></a> [auto\_scaler\_profile](#input\_auto\_scaler\_profile) | (Optional) A auto\_scaler\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input\_automatic\_upgrade\_channel) | (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none. | `string` | `null` | no |
| <a name="input_azure_active_directory_role_based_access_control"></a> [azure\_active\_directory\_role\_based\_access\_control](#input\_azure\_active\_directory\_role\_based\_access\_control) | (Optional) A azure\_active\_directory\_role\_based\_access\_control block as defined below. | `any` | `{}` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | (Optional) Should the Azure Policy Add-On be enabled? | `bool` | `null` | no |
| <a name="input_backup"></a> [backup](#input\_backup) | -------- Backup -------- | `any` | n/a | yes |
| <a name="input_confidential_computing"></a> [confidential\_computing](#input\_confidential\_computing) | (Optional) A confidential\_computing block as defined below. | `any` | `{}` | no |
| <a name="input_cost_analysis_enabled"></a> [cost\_analysis\_enabled](#input\_cost\_analysis\_enabled) | (Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku\_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal. | `bool` | `false` | no |
| <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool) | (Required) A default\_node\_pool block as defined below. | `any` | n/a | yes |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information can be found in the documentation. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_dns_prefix_private_cluster"></a> [dns\_prefix\_private\_cluster](#input\_dns\_prefix\_private\_cluster) | (Optional) Specifies the DNS prefix to use with private clusters. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_enable_diagnostic_settings"></a> [enable\_diagnostic\_settings](#input\_enable\_diagnostic\_settings) | --------------------- Diagnostic Settings --------------------- | `bool` | `true` | no |
| <a name="input_enable_workload_identity"></a> [enable\_workload\_identity](#input\_enable\_workload\_identity) | n/a | `bool` | `false` | no |
| <a name="input_extensions"></a> [extensions](#input\_extensions) | --------------- AKS Extension --------------- | `any` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | (Optional) Should HTTP Application Routing be enabled? | `bool` | `null` | no |
| <a name="input_http_proxy_config"></a> [http\_proxy\_config](#input\_http\_proxy\_config) | (Optional) A http\_proxy\_config block as defined below. | `any` | `{}` | no |
| <a name="input_image_cleaner_enabled"></a> [image\_cleaner\_enabled](#input\_image\_cleaner\_enabled) | (Optional) Specifies whether Image Cleaner is enabled. | `bool` | `null` | no |
| <a name="input_image_cleaner_interval_hours"></a> [image\_cleaner\_interval\_hours](#input\_image\_cleaner\_interval\_hours) | (Optional) Specifies the interval in hours when images should be cleaned up. Defaults to 48. | `number` | `48` | no |
| <a name="input_ingress_application_gateway"></a> [ingress\_application\_gateway](#input\_ingress\_application\_gateway) | (Optional) A ingress\_application\_gateway block as defined below. | `any` | `{}` | no |
| <a name="input_key_management_service"></a> [key\_management\_service](#input\_key\_management\_service) | (Optional) A key\_management\_service block as defined below. | `any` | `{}` | no |
| <a name="input_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#input\_key\_vault\_secrets\_provider) | (Optional) A key\_vault\_secrets\_provider block as defined below. | `any` | `{}` | no |
| <a name="input_kubelet_identity"></a> [kubelet\_identity](#input\_kubelet\_identity) | (Optional) A kubelet\_identity block as defined below. | `any` | `{}` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | (Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as 1.22 are also supported. - The minor version's latest GA patch is automatically chosen in that case. | `string` | `null` | no |
| <a name="input_law_id"></a> [law\_id](#input\_law\_id) | n/a | `any` | n/a | yes |
| <a name="input_linux_profile"></a> [linux\_profile](#input\_linux\_profile) | (Optional) A linux\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | (Optional) If true local accounts will be disabled. | `bool` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | n/a | `any` | `null` | no |
| <a name="input_log_category_types"></a> [log\_category\_types](#input\_log\_category\_types) | n/a | `any` | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) A maintenance\_window block as defined below. | `any` | `{}` | no |
| <a name="input_maintenance_window_auto_upgrade"></a> [maintenance\_window\_auto\_upgrade](#input\_maintenance\_window\_auto\_upgrade) | (Optional) A maintenance\_window\_auto\_upgrade block as defined below. | `any` | `{}` | no |
| <a name="input_maintenance_window_node_os"></a> [maintenance\_window\_node\_os](#input\_maintenance\_window\_node\_os) | (Optional) A maintenance\_window\_node\_os block as defined below. | `any` | `{}` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | n/a | `any` | n/a | yes |
| <a name="input_microsoft_defender"></a> [microsoft\_defender](#input\_microsoft\_defender) | (Optional) A microsoft\_defender block as defined below. | `any` | `{}` | no |
| <a name="input_monitor_metrics"></a> [monitor\_metrics](#input\_monitor\_metrics) | (Optional) A monitor\_metrics block as defined below. | `any` | `{}` | no |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | (Optional) A network\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_network_security_group_id"></a> [network\_security\_group\_id](#input\_network\_security\_group\_id) | ------------------ Role Assignments ------------------ | `string` | n/a | yes |
| <a name="input_network_security_group_id_nodepool"></a> [network\_security\_group\_id\_nodepool](#input\_network\_security\_group\_id\_nodepool) | n/a | `string` | n/a | yes |
| <a name="input_node_os_channel_upgrade"></a> [node\_os\_channel\_upgrade](#input\_node\_os\_channel\_upgrade) | (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None. | `string` | `null` | no |
| <a name="input_node_os_upgrade_channel"></a> [node\_os\_upgrade\_channel](#input\_node\_os\_upgrade\_channel) | (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None. | `string` | `"NodeImage"` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | (Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_nodepool_subnet_id"></a> [nodepool\_subnet\_id](#input\_nodepool\_subnet\_id) | (Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled) | (Optional) Enable or Disable the OIDC issuer URL | `bool` | `null` | no |
| <a name="input_oms_agent"></a> [oms\_agent](#input\_oms\_agent) | (Optional) A oms\_agent block as defined below. | `any` | `{}` | no |
| <a name="input_open_service_mesh_enabled"></a> [open\_service\_mesh\_enabled](#input\_open\_service\_mesh\_enabled) | (Optional) Is Open Service Mesh enabled? | `bool` | `null` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | (Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to false. | `bool` | `false` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | (Optional) Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created. | `bool` | `true` | no |
| <a name="input_routetable_id"></a> [routetable\_id](#input\_routetable\_id) | n/a | `string` | n/a | yes |
| <a name="input_run_command_enabled"></a> [run\_command\_enabled](#input\_run\_command\_enabled) | (Optional) Whether to enable run command for the cluster or not. Defaults to true. | `bool` | `true` | no |
| <a name="input_service_mesh_profile"></a> [service\_mesh\_profile](#input\_service\_mesh\_profile) | (Optional) A service\_mesh\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_service_principal"></a> [service\_principal](#input\_service\_principal) | (Optional) A service\_principal block as defined below. | `any` | `{}` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free. | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | n/a | `any` | n/a | yes |
| <a name="input_storage_profile"></a> [storage\_profile](#input\_storage\_profile) | (Optional) A storage\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. | `string` | `null` | no |
| <a name="input_support_plan"></a> [support\_plan](#input\_support\_plan) | (Optional) Specifies the support plan which should be used for this Kubernetes Cluster. Possible values are KubernetesOfficial and AKSLongTermSupport. Defaults to KubernetesOfficial. | `string` | `"KubernetesOfficial"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags which should be assigned to the Azure Kubernetes Cluster. | `map(any)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | (Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. | `string` | `null` | no |
| <a name="input_user_node_pool"></a> [user\_node\_pool](#input\_user\_node\_pool) | --------=------ AKS Node Pool --------=------ | `map` | <pre>{<br/>  "user1": {<br/>    "enable_auto_scaling": true,<br/>    "max_count": "2",<br/>    "min_count": "1",<br/>    "mode": "user",<br/>    "node_count": "1",<br/>    "vm_size": "Standard_D2_v2"<br/>  },<br/>  "user2": {<br/>    "enable_auto_scaling": true,<br/>    "max_count": "2",<br/>    "min_count": "1",<br/>    "mode": "user",<br/>    "node_count": "1",<br/>    "vm_size": "Standard_D2_v2"<br/>  }<br/>}</pre> | no |
| <a name="input_web_app_routing"></a> [web\_app\_routing](#input\_web\_app\_routing) | (Optional) A web\_app\_routing block as defined below. | `any` | `{}` | no |
| <a name="input_windows_profile"></a> [windows\_profile](#input\_windows\_profile) | (Optional) A windows\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_workload_autoscaler_profile"></a> [workload\_autoscaler\_profile](#input\_workload\_autoscaler\_profile) | (Optional) A workload\_autoscaler\_profile block as defined below. | `any` | `{}` | no |
| <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled) | (Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | The Kubernetes cluster server host. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The Kubernetes Managed Cluster ID. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The Kubernetes Managed Cluster Name. |
| <a name="output_current_kubernetes_version"></a> [current\_kubernetes\_version](#output\_current\_kubernetes\_version) | The current version running on the Azure Kubernetes Managed Cluster. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the Azure Kubernetes Managed Cluster. |
| <a name="output_http_application_routing_zone_name"></a> [http\_application\_routing\_zone\_name](#output\_http\_application\_routing\_zone\_name) | The Zone Name of the HTTP Application Routing. |
| <a name="output_ingress_application_gateway"></a> [ingress\_application\_gateway](#output\_ingress\_application\_gateway) | A ingress\_application\_gateway block as defined below. |
| <a name="output_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#output\_key\_vault\_secrets\_provider) | A key\_vault\_secrets\_provider block as defined below. |
| <a name="output_keyvault_identity_clientID"></a> [keyvault\_identity\_clientID](#output\_keyvault\_identity\_clientID) | The Client ID of the user-defined Managed Identity used by the Secret Provider. |
| <a name="output_keyvault_identity_objectID"></a> [keyvault\_identity\_objectID](#output\_keyvault\_identity\_objectID) | The Object ID of the user-defined Managed Identity used by the Secret Provider. |
| <a name="output_kube_admin_config"></a> [kube\_admin\_config](#output\_kube\_admin\_config) | A kube\_admin\_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | A kube\_config block as defined below. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | Raw Kubernetes config to be used by kubectl and other compatible tools. |
| <a name="output_kubelet_identity_clientID"></a> [kubelet\_identity\_clientID](#output\_kubelet\_identity\_clientID) | The Client ID of the user-defined Managed Identity to be assigned to the Kubelets. |
| <a name="output_kubelet_identity_objectID"></a> [kubelet\_identity\_objectID](#output\_kubelet\_identity\_objectID) | The Object ID of the user-defined Managed Identity assigned to the Kubelets. |
| <a name="output_network_profile"></a> [network\_profile](#output\_network\_profile) | A network\_profile block as defined below. |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| <a name="output_node_resource_group_id"></a> [node\_resource\_group\_id](#output\_node\_resource\_group\_id) | The ID of the Resource Group containing the resources for this Managed Kubernetes Cluster. |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | The OIDC issuer URL that is associated with the cluster. |
| <a name="output_oms_agent"></a> [oms\_agent](#output\_oms\_agent) | A oms\_agent block as defined below. |
| <a name="output_portal_fqdn"></a> [portal\_fqdn](#output\_portal\_fqdn) | The FQDN for the Azure Portal resources when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster. |
| <a name="output_private_fqdn"></a> [private\_fqdn](#output\_private\_fqdn) | The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster. |
