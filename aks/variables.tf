#--------------------------
# Azure Kubernetes Cluster
#--------------------------
variable "aks_cluster_name" {
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "default_node_pool" {
  description = "(Required) A default_node_pool block as defined below."
  type        = any
}

variable "subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist."
  type        = string
  default     = null
}

variable "dns_prefix_private_cluster" {
  description = "(Optional) Specifies the DNS prefix to use with private clusters. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "aci_connector_linux" {
  description = "(Optional) A aci_connector_linux block as defined below."
  type        = any
  default     = {}
}

variable "automatic_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."
  type        = string
  default     = null
}

variable "api_server_access_profile" {
  description = "(Optional) An api_server_access_profile block as defined below."
  type        = any
  default     = {}
}

variable "auto_scaler_profile" {
  description = "(Optional) A auto_scaler_profile block as defined below."
  type        = any
  default     = {}
}

variable "azure_active_directory_role_based_access_control" {
  description = "(Optional) A azure_active_directory_role_based_access_control block as defined below."
  type        = any
  default     = {}
}

variable "admin_group_object_ids" {
  description = "(Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster."
  type        = list(string)
  default     = []
}

variable "tenant_id" {
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used."
  type        = string
  default     = null
}

variable "azure_policy_enabled" {
  description = "(Optional) Should the Azure Policy Add-On be enabled?"
  type        = bool
  default     = null
}

variable "confidential_computing" {
  description = "(Optional) A confidential_computing block as defined below."
  type        = any
  default     = {}
}

variable "cost_analysis_enabled" {
  description = "(Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal."
  type        = bool
  default     = false
}

variable "disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information can be found in the documentation. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "http_application_routing_enabled" {
  description = "(Optional) Should HTTP Application Routing be enabled?"
  type        = bool
  default     = null
}

variable "http_proxy_config" {
  description = "(Optional) A http_proxy_config block as defined below."
  type        = any
  default     = {}
}

variable "image_cleaner_enabled" {
  description = "(Optional) Specifies whether Image Cleaner is enabled."
  type        = bool
  default     = null
}

variable "image_cleaner_interval_hours" {
  description = "(Optional) Specifies the interval in hours when images should be cleaned up. Defaults to 48."
  type        = number
  default     = 48
}

variable "ingress_application_gateway" {
  description = "(Optional) A ingress_application_gateway block as defined below."
  type        = any
  default     = {}
}

variable "key_management_service" {
  description = "(Optional) A key_management_service block as defined below."
  type        = any
  default     = {}
}

variable "key_vault_secrets_provider" {
  description = "(Optional) A key_vault_secrets_provider block as defined below."
  type        = any
  default     = {}
}

variable "kubelet_identity" {
  description = "(Optional) A kubelet_identity block as defined below."
  type        = any
  default     = {}
}

variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as 1.22 are also supported. - The minor version's latest GA patch is automatically chosen in that case."
  type        = string
  default     = null
}

variable "upgrade_override" {
  description = "Determines whether to force upgrade the cluster."
  type        = any
  default     = {}
}

variable "linux_profile" {
  description = "(Optional) A linux_profile block as defined below."
  type        = any
  default     = {}
}

variable "local_account_disabled" {
  description = "(Optional) If true local accounts will be disabled."
  type        = bool
  default     = null
}

variable "maintenance_window" {
  description = "(Optional) A maintenance_window block as defined below."
  type        = any
  default     = {}
}

variable "maintenance_window_auto_upgrade" {
  description = "(Optional) A maintenance_window_auto_upgrade block as defined below."
  type        = any
  default     = {}
}

variable "maintenance_window_node_os" {
  description = "(Optional) A maintenance_window_node_os block as defined below."
  type        = any
  default     = {}
}

variable "microsoft_defender" {
  description = "(Optional) A microsoft_defender block as defined below."
  type        = any
  default     = {}
}

variable "monitor_metrics" {
  description = "(Optional) A monitor_metrics block as defined below."
  type        = any
  default     = {}
}

variable "network_profile" {
  description = "(Optional) A network_profile block as defined below."
  type        = any
  default     = {}
}

variable "node_os_channel_upgrade" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None."
  type        = string
  default     = null
}

variable "node_os_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None."
  type        = string
  default     = "NodeImage"
}

variable "node_resource_group" {
  description = "(Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "oidc_issuer_enabled" {
  description = "(Optional) Enable or Disable the OIDC issuer URL"
  type        = bool
  default     = null
}

variable "oms_agent" {
  description = "(Optional) A oms_agent block as defined below."
  type        = any
  default     = {}
}

variable "open_service_mesh_enabled" {
  description = "(Optional) Is Open Service Mesh enabled?"
  type        = bool
  default     = null
}

variable "private_cluster_enabled" {
  description = "(Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "private_cluster_public_fqdn_enabled" {
  description = "(Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to false."
  type        = bool
  default     = false
}

variable "service_mesh_profile" {
  description = "(Optional) A service_mesh_profile block as defined below."
  type        = any
  default     = {}
}

variable "workload_autoscaler_profile" {
  description = "(Optional) A workload_autoscaler_profile block as defined below."
  type        = any
  default     = {}
}

variable "workload_identity_enabled" {
  description = "(Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false."
  type        = bool
  default     = false
}

variable "role_based_access_control_enabled" {
  description = "(Optional) Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "run_command_enabled" {
  description = "(Optional) Whether to enable run command for the cluster or not. Defaults to true."
  type        = bool
  default     = true
}

variable "service_principal" {
  description = "(Optional) A service_principal block as defined below."
  type        = any
  default     = {}
}

variable "sku_tier" {
  description = "(Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  type        = string
  default     = null
}

variable "storage_profile" {
  description = "(Optional) A storage_profile block as defined below."
  type        = any
  default     = {}
}

variable "support_plan" {
  description = "(Optional) Specifies the support plan which should be used for this Kubernetes Cluster. Possible values are KubernetesOfficial and AKSLongTermSupport. Defaults to KubernetesOfficial."
  type        = string
  default     = "KubernetesOfficial"
}

variable "web_app_routing" {
  description = "(Optional) A web_app_routing block as defined below."
  type        = any
  default     = {}
}

variable "windows_profile" {
  description = "(Optional) A windows_profile block as defined below."
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Azure Kubernetes Cluster."
  type        = map(any)
  default     = {}
}

#--------=------
# AKS Node Pool
#--------=------
variable "user_node_pool" {
  default = {
    user1 = {
      vm_size             = "Standard_D2_v2"
      node_count          = "1"
      enable_auto_scaling = true
      mode                = "user"
      min_count           = "1"
      max_count           = "2"
    },
    user2 = {
      vm_size             = "Standard_D2_v2"
      node_count          = "1"
      enable_auto_scaling = true
      mode                = "user"
      min_count           = "1"
      max_count           = "2"
    }
  }
}

variable "nodepool_subnet_id" {
  description = "(Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

#------------------
# Role Assignments
#------------------
variable "network_security_group_id" {
  type = string
}

variable "network_security_group_id_nodepool" {
  type = string
}

variable "routetable_id" {
  type = string
}

#--------
# Backup
#--------
variable "backup" {
  type = any
}

variable "storage_account_id" {
  type = any
}

#---------------
# AKS Extension
#---------------
variable "extensions" {
  default = {}
  type    = any
}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  default = true
}

variable "law_id" {}

variable "log_analytics_destination_type" {
  default = null
}

variable "log_category_types" {}

variable "metrics" {}

variable "retention_days" {
  default = 30
}

variable "enable_workload_identity" {
  default = false
  type    = bool
}