variable "black_box_namespace" {
  description = "The namespace where the Blackbox Exporter will be deployed."
  type        = string
  default     = "monitoring"
}

variable "prometheus_namespace" {
  description = "The namespace where Prometheus is deployed."
  type        = string
  default     = "monitoring"
}

variable "prometheus_release" {
  description = "Prometheus Helm release name."
  type        = string
  default     = "prometheus"
}

variable "helm_chart_version" {
  description = "Version of the Blackbox Exporter Helm chart."
  type        = string
  default     = "8.17.0"
}

variable "blackbox_image_tag" {
  description = "Tag of the Blackbox Exporter Docker image."
  type        = string
  default     = "v0.21.0"
}

variable "blackbox_enabled" {
  description = "Enable or disable Blackbox Exporter."
  type        = bool
  default     = true
}

variable "probe_http_timeout" {
  description = "Timeout for HTTP probes."
  type        = string
  default     = "10s"
}

variable "probe_http_retries" {
  description = "Number of retries for HTTP probes."
  type        = number
  default     = 3
}

variable "probe_tcp_timeout" {
  description = "Timeout for TCP probes."
  type        = string
  default     = "5s"
}

variable "probe_tcp_retries" {
  description = "Number of retries for TCP probes."
  type        = number
  default     = 3
}

variable "probe_icmp_timeout" {
  description = "Timeout for ICMP probes."
  type        = string
  default     = "5s"
}

variable "probe_icmp_retries" {
  description = "Number of retries for ICMP probes."
  type        = number
  default     = 3
}