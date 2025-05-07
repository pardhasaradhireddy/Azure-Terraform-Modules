#-----------------
# Firewall Policy
#-----------------
variable "firewall_policy_name" {
  description = "The name of the Azure Firewall Policy."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Firewall Policy will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the Firewall Policy will be deployed."
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier for the Firewall Policy (e.g., 'Standard' or 'Premium')."
  type        = string
}

variable "private_ip_ranges" {
  description = "List of private IP address ranges for the Firewall Policy."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the Firewall Policy."
  type        = map(any)
}

#----------------------------------------
# Firewall Policy Rule Collection Groups
#----------------------------------------
#-------------------------
# rule_collection_group_1
#-------------------------
variable "rule_collection_group_1" {
  description = "Configuration for rule collection group 1."
  type        = any
}

variable "application_rules" {
  description = "Application rules for rule collection group 1."
  type        = any
}

variable "network_rules" {
  description = "Network rules for rule collection group 1."
  type        = any
}

variable "nat_rules" {
  description = "NAT rules for rule collection group 1."
  type        = any
}

#---------------------------
# rule_collection_group_aks
#---------------------------
variable "rule_collection_group_aks" {
  description = "Configuration for rule collection group AKS."
  type        = any
}

variable "application_rules_aks" {
  description = "Application rules for rule collection group AKS."
  type        = any
}

variable "network_rules_aks" {
  description = "Network rules for rule collection group AKS."
  type        = any
}

#---------------------------
# rule_collection_group_cdp
#---------------------------
variable "rule_collection_group_cdp" {
  description = "Configuration for rule collection group CDP."
  type        = any
}

variable "application_rules_cdp" {
  description = "Application rules for rule collection group CDP."
  type        = any
}

/* variable "network_rules_cdp" {
  description = "Network rules for rule collection group CDP."
  type        = any
} */

#----------------
# Azure Firewall
#----------------
variable "firewall_name" {
  description = "The name of the Azure Firewall instance."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Azure Firewall instance."
  type        = string
}

variable "fw_ip_configuration_name" {
  description = "The name of the firewall IP configuration."
  type        = string
}

variable "fw_subnet_id" {
  description = "The ID of the subnet where the firewall is deployed."
  type        = string
}

variable "fw_public_ip_address_id" {
  description = "The ID of the public IP address associated with the firewall."
  type        = string
}

variable "mgmt_ip_configuration_name" {
  description = "The name of the management IP configuration."
  type        = string
}

variable "mgmt_subnet_id" {
  description = "The ID of the management subnet."
  type        = string
}

variable "mgmt_public_ip_address_id" {
  description = "The ID of the public IP address for firewall management."
  type        = string
}

variable "fw_apim_ip_configuration_name" {
  description = "The name of the API Management (APIM) IP configuration for the firewall."
  type        = string
}

variable "fw_apim_public_ip_address_id" {
  description = "The ID of the public IP address for the APIM firewall configuration."
  type        = string
}

variable "fw_apim_qa_ip_configuration_name" {
  description = "The name of the APIM QA IP configuration for the firewall."
  type        = string
}

variable "fw_apim_qa_public_ip_address_id" {
  description = "The ID of the public IP address for the APIM QA firewall configuration."
  type        = string
}

variable "fw_apim_prod_ip_configuration_name" {
  description = "The name of the APIM production IP configuration for the firewall."
  type        = string
}

variable "fw_apim_prod_public_ip_address_id" {
  description = "The ID of the public IP address for the APIM production firewall configuration."
  type        = string
}

#---------------------
# Diagnostic Settings
#---------------------
variable "enable_diagnostic_settings" {
  description = "Flag to enable or disable diagnostic settings."
  type        = bool
  default     = true
}

variable "law_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}

variable "log_analytics_destination_type" {
  description = "The destination type for Log Analytics (e.g., AzureMonitor or Storage)."
  type        = string
  default     = null
}

variable "log_category_types" {
  description = "List of log categories to enable for diagnostics."
  type        = any
}

variable "metrics" {
  description = "List of metrics to enable for diagnostics."
  type        = any
}

variable "retention_days" {
  description = "Number of days to retain logs in Log Analytics."
  type        = number
  default     = 30
}