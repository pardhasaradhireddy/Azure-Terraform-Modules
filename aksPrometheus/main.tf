resource "helm_release" "aks-prometheus" {
  name             = var.prometheus_release_name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = var.prometheus_version
  create_namespace = "true"
  namespace        = var.namespace

  values = [
    file("${path.module}/custom-values.yaml")
  ]

  set {
    name  = "prometheus.prometheusSpec.storageSpec.volumeClaimTemplate.spec.resources.requests.storage"
    value = var.prometheus_storage
  }

  set {
    name  = "prometheus.prometheusSpec.retention"
    value = var.prometheus_retention
  }

  set {
    name  = "alertmanager.config.receivers[1].pagerduty_configs[0].routing_key"
    value = var.pagerduty_routing_key
  }

  set {
    name  = "alertmanager.config.receivers[1].pagerduty_configs[0].details.cluster"
    value = var.cluster_name
  }

  set {
    name  = "alertmanager.config.receivers[1].pagerduty_configs[0].details.environment"
    value = var.environment
  }

  set {
    name  = "prometheus.prometheusSpec.containers[0].resources.requests.memory"
    value = var.prometheus_memoryrequest
  }

}