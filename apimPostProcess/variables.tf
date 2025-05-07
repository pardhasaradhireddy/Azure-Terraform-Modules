variable "aks_app_gateway_private_fqdn" {}

variable "apim_name" {}

variable "api_management_app_insights_logger_id" {}

variable "apim_resource_group_name" {}

variable "location" {}

variable "cms_salesforce_validation_fqdn" {}

variable "cms_salesforce_subscription_fqdn" {}
variable "cms_salesforce_security_fqdn" {}

variable "enable_prometheus_pushgateway" {
  default = false
}

variable "eb_truckconnect_policy_identity" {}

variable "eb_legacy_policy_identity" {}

variable "public_dns_azure_firewall" {}