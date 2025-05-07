variable "frontdoor_name" {
  description = "(Required) Specifies the name of the Front Door Profile. Changing this forces a new resource to be created."
  type        = any
  default     = null
}

variable "frontdoor_sku_name" {
  description = "(Required) Specifies the SKU for this Front Door Profile. Possible values include Standard_AzureFrontDoor and Premium_AzureFrontDoor. Changing this forces a new resource to be created."
  type        = any
  default     = "Standard_AzureFrontDoor"
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group where this Front Door Profile should exist. Changing this forces a new resource to be created."
  type        = any
  default     = {}
}


variable "frontdoor_endpoint" {
  description = "(Optional) A map of the endpoints to be created in Front Door"
  type        = any
  default     = {}
}

variable "frontdoor_origin_group" {
  description = "(Optional) A map of the origin groups to be created in Front Door"
  type        = any
  default     = {}
}

variable "frontdoor_origin" {
  description = "(Optional) A map of the origins to be created in Front Door"
  type        = any
  default     = {}
}

variable "frontdoor_custom_domain" {
  description = "(Optional) A map of the custom domains to be created in Front Door"
  type        = any
  default     = {}
}

variable "rule_set" {
  description = "(Optional) A map of the rule sets to be created in Front Door"
  type        = any
  default     = {}
}

variable "rule" {
  description = "(Optional) A map of the rule to be created in Front Door"
  type        = any
  default     = {}
}

variable "frontdoor_route" {
  description = "(Optional) A map of the routes to be created in Front Door"
  type        = any
  default     = {}
}

variable "frontdoor_security_policy" {
  description = "(Optional) A map of the security policies to be created in Front Door"
  type        = any
  default     = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#------------------------
# Public DNS CNAME Record
#------------------------

variable "dns_cname_records" {
  description = "(Optional) A map of DNS Cname Records used in the DNS zone"
  type        = any
  default     = {}
}

#----------------------
# Public DNS TXT Record
#----------------------

variable "dns_txt_records" {
  description = "(Optional) A map of DNS TXT Records used in the DNS zone"
  type        = any
  default     = {}
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