variable "name" {
  description = "The name of the PrometheusRule"
  type        = string
}

variable "expr" {
  description = "The expression for the alert rule"
  type        = string
}

variable "for" {
  description = "The duration for which the alert should be active"
  type        = string
}

variable "severity" {
  description = "The severity of the alert"
  type        = string
}

variable "summary" {
  description = "The summary for the alert annotation"
  type        = string
}

variable "runbook" {
  description = "The runbook for the alert annotation"
  type        = string
}

variable "description" {
  description = "The description for the alert annotation"
  type        = string
}

variable "namespace" {
  default = "monitoring"
}
