#-------------------------
# Azure Connection monitor
#-------------------------
variable "connection_monitor_name" {
  description = "The name of the Network Connection Monitor."
  type        = string
}

variable "connection_monitor_location" {
  description = "The location/region where the Network Connection Monitor should exist."
  type        = string
}

variable "tags" {
  description = "Tags to associate with the Network Connection Monitor."
  type        = any
  default     = {}
}
variable "endpoints" {
  description = "List of endpoints to configure for the Network Connection Monitor."
  type = list(object({
    name                 = string
    target_resource_type = string
    target_resource_id   = string
    # location    = string
    address = string
  }))
  default = []
}

variable "test_configurations" {
  description = "List of test configurations to be applied."
  type = list(object({
    name                      = string
    test_frequency_in_seconds = string
    protocol                  = string
    http_configuration = list(object({
      method = string
      path   = string
    }))
    tcp_configuration = list(object({
      port = number
    }))
  }))
  default = []
}

variable "network_watcher_id" {
  description = "The ID of the Network Watcher to which the Network Connection Monitor is associated."
  type        = string
}

variable "test_groups" {
  description = "List of test groups to configure for the Network Connection Monitor."
  type = list(object({
    name                     = string
    destination_endpoints    = list(string) # List of test configuration IDs to be included in this test group
    test_configuration_names = list(string)
    source_endpoints         = list(string)
  }))
  default = []
}