#------------------
# Key Vault Secret
#------------------

variable "secret_name" {
  description = "The name of the Key Vault secret."
  type        = string
}

variable "secret_value" {
  description = "The value of the Key Vault secret."
  type        = string
  sensitive   = true
}

variable "key_vault_id" {
  description = "The resource ID of the Key Vault where the secret will be stored."
  type        = string
}

variable "content_type" {
  description = "The content type of the Key Vault secret, providing metadata about the secret's value."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault secret."
  type        = map(string)
  default     = {}
}

variable "expiration_date" {
  description = "The expiration date of the secret in RFC3339 format (e.g., '2023-12-31T23:59:59Z'). If not set, the secret does not expire."
  type        = string
  default     = null
}