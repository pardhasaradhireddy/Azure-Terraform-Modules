#-------------------
# Network Interface
#-------------------
variable "location" {}

variable "resource_group_name" {}

variable "subnet_id" {}

variable "private_ip_address_allocation" {
  default = "Dynamic"
}

variable "private_ip_address" {}

variable "tags" {}

#-------------------------
# Windows Virtual Machine
#-------------------------
variable "windows_virtual_machine_name" {}

variable "size" {}

variable "admin_username" {}

variable "admin_password" {}

variable "provision_vm_agent" {
  default = true
}

variable "allow_extension_operations" {
  default = true
}

variable "managed_identity" {
  default = {}
}

variable "os_disk" {}

variable "source_image_reference" {}