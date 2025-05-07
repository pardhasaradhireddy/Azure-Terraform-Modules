#-------------------
# Policy Definition
#-------------------
variable "policy_definition_name" {
  description = "(Required) The name of the policy definition. Changing this forces a new resource to be created."
  default     = null
  type        = string
}

variable "policy_type" {
  description = "(Required) The policy type. Possible values are BuiltIn, Custom, NotSpecified and Static. Changing this forces a new resource to be created."
  default     = null
  type        = string
}

variable "mode" {
  description = "(Required) The policy resource manager mode that allows you to specify which resource types will be evaluated. Possible values are All, Indexed, Microsoft.ContainerService.Data, Microsoft.CustomerLockbox.Data, Microsoft.DataCatalog.Data, Microsoft.KeyVault.Data, Microsoft.Kubernetes.Data, Microsoft.MachineLearningServices.Data, Microsoft.Network.Data and Microsoft.Synapse.Data."
  default     = null
  type        = string
}

variable "display_name" {
  description = "(Required) The display name of the policy definition."
  default     = null
  type        = string
}

variable "description" {
  description = "(Optional) The description of the policy definition."
  default     = null
  type        = string
}

variable "management_group_id" {
  description = "(Optional) The id of the Management Group where this policy should be defined. Changing this forces a new resource to be created."
  default     = null
  type        = string
}

variable "policy_rule" {
  description = "(Optional) The policy rule for the policy definition. This is a JSON string representing the rule that contains an if and a then block."
  default     = null
  type        = any
}

variable "metadata" {
  description = "(Optional) The metadata for the policy definition. This is a JSON string representing additional metadata that should be stored with the policy definition."
  default     = null
  type        = any
}

variable "parameters" {
  description = "(Optional) Parameters for the policy definition. This field is a JSON string that allows you to parameterize your policy definition."
  default     = null
  type        = any
}