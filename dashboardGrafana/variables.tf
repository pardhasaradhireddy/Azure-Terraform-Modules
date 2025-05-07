#-------------------
# Dashboard Grafana
#-------------------

variable "dashboard_grafana_name" {
  description = "The name of the Grafana dashboard to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Grafana dashboard."
  type        = string
}

variable "location" {
  description = "The Azure region where the Grafana dashboard will be deployed."
  type        = string
}

variable "api_key_enabled" {
  description = "Specifies whether API key authentication is enabled for the Grafana dashboard."
  type        = bool
  default     = true
}

variable "auto_generated_domain_name_label_scope" {
  description = "Specifies the scope for the auto-generated domain name label. Options are 'TenantReuse' or 'Subscription'."
  type        = string
  default     = "TenantReuse"
}

variable "deterministic_outbound_ip_enabled" {
  description = "Specifies whether deterministic outbound IP addresses are enabled for the Grafana dashboard."
  type        = bool
  default     = false
}

variable "azure_monitor_workspace_integrations" {
  description = "Specifies the Azure Monitor workspace integrations for the Grafana dashboard. Set to `null` if no integration is required."
  type        = any
  default     = null
}

variable "grafana_major_version" {
  description = "The major version of Grafana to deploy."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Specifies whether public network access is enabled for the Grafana dashboard."
  type        = bool
  default     = true
}

variable "sku" {
  description = "The pricing tier for the Grafana dashboard. Options include 'Standard' and 'Free'."
  type        = string
  default     = "Standard"
}

variable "zone_redundancy_enabled" {
  description = "Specifies whether zone redundancy is enabled for the Grafana dashboard for high availability."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the Grafana dashboard for resource categorization and tracking."
  type        = map(string)
}