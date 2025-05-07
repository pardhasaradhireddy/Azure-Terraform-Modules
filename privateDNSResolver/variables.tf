#----------------------
# Private DNS Resolver
#----------------------
variable "private_dns_resolver_name" {}

variable "resource_group_name" {}

variable "location" {}

variable "virtual_network_id" {}

#-------------------
# Outbound Endpoint
#-------------------
variable "outbound_endpoint_name" {}

variable "subnet_id" {}

variable "tags" {}

#--------------------
# Forwarding Ruleset
#--------------------
variable "forwarding_ruleset_name" {}

#------------------
# Forwarding Rules
#------------------
variable "forwarding_rules" {}

#----------------------
# Virtual Network Link
#----------------------
variable "virtual_network_link_name" {}