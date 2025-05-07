resource "helm_release" "this" {
  name       = var.release_name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  version    = var.helm_version
  namespace  = var.namespace

  timeout = 600

  values = [
    file("${path.module}/custom_values.yaml")
  ]

  set {
    name  = "loki.persistence.size"
    value = var.persistanceVolumeSize
  }

  set {
    name  = "loki.resources.requests.memory"
    value = var.loki_memory_request
  }

  set {
    name  = "loki.resources.limits.memory"
    value = var.loki_memory_limit
  }

  set {
    name  = "loki.config.limits_config.retention_period"
    value = var.retention_period
  }
}