variable "tags" {
  description = "map of tags for resource"
  default     = {}
}

#-----------------
# Public DNS Zone
#-----------------

variable "public_dns_zone_name" {
  description = "(Required) The name of the DNS Zone. Must be a valid domain name. Changing this forces a new resource to be created."
  type        = string
}

#---------------------------
# Gobal DNS Record Variables
#---------------------------
variable "resource_group_name" {
  description = "(Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created."
  type        = any
}

#--------------------
# Public DNS A Record
#--------------------

variable "dns_a_records" {
  description = "(Optional) A map of DNS A Records used in the DNS zone"
  type        = any
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

#----------------------
# Public DNS NS Record
#----------------------

variable "dns_ns_records" {
  description = "(Optional) A map of DNS NS Records used in the DNS zone"
  type        = any
  default     = {}
}

