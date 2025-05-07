#--------------------------------
# Subscription Policy Assignment
#--------------------------------
variable "subscription_policy_assignment_name" {
  description = "(Required) The name which should be used for this Policy Assignment. Changing this forces a new Policy Assignment to be created. Cannot exceed 64 characters in length."
  type        = string
  default     = null
}

variable "policy_definition_id" {
  description = "(Required) The ID of the Policy Definition or Policy Definition Set. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "(Required) The ID of the Subscription where this Policy Assignment should be created. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) A description which should be used for this Policy Assignment."
  type        = string
  default     = null
}

variable "display_name" {
  description = "(Optional) The Display Name for this Policy Assignment."
  type        = string
  default     = null
}

variable "enforce" {
  description = "(Optional) Specifies if this Policy should be enforced or not? Defaults to true."
  type        = bool
  default     = true
}

variable "identity" {
  description = "(Optional) An identity block as defined below."
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = {
    type         = null
    identity_ids = []
  }
}

variable "location" {
  description = "(Optional) The Azure Region where the Policy Assignment should exist. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = null
}

variable "metadata" {
  description = "(Optional) A JSON mapping of any Metadata for this Policy."
  type        = any
  default     = null
}

variable "non_compliance_message" {
  description = "(Optional) One or more non_compliance_message blocks as defined below."
  type = object({
    content                        = optional(string)
    policy_definition_reference_id = optional(string)
  })
  default = {}
}

variable "not_scopes" {
  description = "(Optional) Specifies a list of Resource Scopes (for example a Subscription, or a Resource Group) within this Management Group which are excluded from this Policy."
  type        = list(string)
  default     = []
}

variable "parameters" {
  description = "(Optional) A JSON mapping of any Parameters for this Policy."
  type        = any
  default     = null
}

variable "overrides" {
  description = "(Optional) One or more overrides blocks as defined below. More detail about overrides and resource_selectors."
  type = object({
    value = any
    selectors = object({
      in     = list(any)
      not_in = list(any)
    })
  })
  default = null
}

variable "resource_selectors" {
  description = "The resource selectors for the policy assignment."
  type = object({
    name = string
    selectors = object({
      kind   = string
      in     = list(any)
      not_in = list(any)
    })
  })
  default = null
}