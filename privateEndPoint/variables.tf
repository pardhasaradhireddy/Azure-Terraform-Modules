#-------------------
# Private End Point
#-------------------
variable "private_endpoint_name" {
  description = "Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
  type        = string
}

variable "custom_network_interface_name" {
  description = "The custom name of the network interface attached to the private endpoint. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "private_dns_zone_group_name" {
  description = "Specifies the Name of the Private DNS Zone Group."
  type        = string
}

variable "private_dns_zone_ids" {
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
  type        = list(string)
}

variable "private_service_connection_name" {
  description = "Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created."
  type        = string
}

variable "is_manual_connection" {
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
  type        = string
}

variable "private_connection_resource_id" {
  description = "The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private_connection_resource_id or private_connection_resource_alias must be specified. Changing this forces a new resource to be created. For a web app or function app slot, the parent web app should be used in this field instead of a reference to the slot itself."
  type        = string
  default     = null
}

variable "private_connection_resource_alias" {
  description = "The Service Alias of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
  type        = string
  default     = null
}

variable "subresource_names" {
  description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id."
  type        = list(string)
}

variable "request_message" {
  description = "A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource. The provider allows a maximum request message length of 140 characters, however the request message maximum length is dependent on the service the private endpoint is connected to."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the privateEndPoint resource."
  type        = map(string)
  default     = {}
}