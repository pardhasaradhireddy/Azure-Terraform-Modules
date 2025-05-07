#----------------
# Resource Group
#----------------

variable "network_rg_name" {}

variable "location" {}

variable "tags" {}

#-----------------
# Virtual Network
#-----------------

variable "service_endpoints" {
  type = list(any)
}

variable "vnet_list" {
  type = object({
    name    = string
    iprange = list(string)
    snets   = map(string)
  })
}

variable "vnet_diagnostics_name" {}

variable "log_analytics_workspace_uri" {}

variable "delegation_subnet" {
  default = ""
}

variable "delegation_name" {
  default = ""
}

variable "delegation_service" {
  default = ""
}

