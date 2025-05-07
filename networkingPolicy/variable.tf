variable "namespace" {
  description = "define the namespace for that particular policy"
  type        = string

}

variable "policy_name" {
  type        = string
  description = "Name of the NetworkPolicy"
}

variable "policy_types" {
  type        = list(string)
  description = "List of policy types like Ingress, Egress"
  default     = ["Ingress"]
}

variable "match_expressions" {
  description = "List of match expressions for the pod selector"
  type = map(object({
    key      = optional(string)
    operator = optional(string)
    values   = optional(list(string))
  }))
}


variable "ingress" {
  description = "List of ingress rules"
  type = map(object({
    from = map(object({
      ip_block = optional(object({
        cidr   = string
        except = list(string)
      }))
      pod_selector = optional(object({
        match_labels = map(string)
      }))
      namespace_selector = optional(object({
        match_labels = map(string)
      }))
    }))
  }))
}