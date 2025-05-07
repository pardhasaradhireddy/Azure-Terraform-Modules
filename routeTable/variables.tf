#-------------
# Route Table
#-------------
variable "route_table_name" {}

variable "location" {}

variable "resource_group_name" {}

variable "tags" {}

variable "disable_bgp_route_propagation" {
  type    = bool
  default = false
}

#-------
# Route
#-------
variable "routes" {}

#--------------------------------
# Route Table Subnet Association
#--------------------------------
variable "subnet_ids" {}