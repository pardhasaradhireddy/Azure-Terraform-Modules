variable "kubecost_release_name" {
  description = "Name of the KubeCost Helm release"
  type        = string
  default     = ""
}

variable "kubecost_namespace" {
  description = "Namespace where KubeCost will be deployed"
  type        = string
  default     = ""
}

variable "kubecost_version" {
  description = "Version of the Kubecost"
  type        = string
  default     = "1.107.1"
}

# variable "pvc_name" {
#   description = "Name of the Persistent Volume Claim"
#   type        = string
# }

# variable "storage_class" {
#   description = "Storage class for the PVC"
#   type        = string
# }

# variable "access_modes" {
#   description = "List of access modes for the PVC"
#   type        = list(string)
# }

# variable "kubecost_storage" {
#   description = "Size of storage for the PVC"
#   type        = string
# }
