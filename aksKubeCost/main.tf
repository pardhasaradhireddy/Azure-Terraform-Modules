resource "helm_release" "kubecost" {
  name       = var.kubecost_release_name
  repository = "https://kubecost.github.io/cost-analyzer"
  chart      = "cost-analyzer"
  version    = var.kubecost_version
  namespace  = var.kubecost_namespace

  wait    = false
  timeout = 5000

  set {
    name  = "global.prometheus.fqdn"
    value = "http://prometheus-kube-prometheus-prometheus.monitoring.svc:9090"
  }

  set {
    name  = "global.prometheus.enabled"
    value = "false"
  }

  set {
    name  = "global.grafana.enabled"
    value = "false"
  }
  set {
    name  = "global.grafana.proxy"
    value = "false"
  }
  set {
    name  = "kubecostMetrics.emitNamespaceAnnotations"
    value = "true"
  }
  set {
    name  = "kubecostMetrics.emitPodAnnotations"
    value = "true"
  }
  set {
    name  = "networkCosts.prometheusScrape"
    value = "true"
  }
  set {
    name  = "kubecostProductConfigs.grafanaURL"
    value = "https://amg-hub-cus-01-c8crgndmd9hpg3en.cus.grafana.azure.com"
  }
  set {
    name  = "global.podAnnotations.team"
    value = "CloudOps"
  }

  set {
    name  = "global.podAnnotations.owner"
    value = "puverma"
  }
}