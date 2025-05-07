terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0" # Use the latest compatible version of Helm 3.x
    }
  }
}

# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
# }
resource "helm_release" "blackbox_exporter" {
  name       = "blackbox-exporter"
  namespace  = var.black_box_namespace
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-blackbox-exporter"
  version    = var.helm_chart_version
  values = [
    yamlencode(
      merge(
        yamldecode(file("${path.module}/custom-values.yaml")),
        {
          blackbox_image_tag   = var.blackbox_image_tag
          blackbox_enabled     = var.blackbox_enabled
          probe_http_timeout   = var.probe_http_timeout
          probe_http_retries   = var.probe_http_retries
          probe_tcp_timeout    = var.probe_tcp_timeout
          probe_tcp_retries    = var.probe_tcp_retries
          probe_icmp_timeout   = var.probe_icmp_timeout
          probe_icmp_retries   = var.probe_icmp_retries
          prometheus_namespace = var.prometheus_namespace
          prometheus_release   = var.prometheus_release
        }
      )
    )
  ]

  set {
    name  = "serviceMonitor.enabled"
    value = "true"
  }

  set {
    name  = "serviceMonitor.namespace"
    value = var.prometheus_namespace
  }

  set {
    name  = "serviceMonitor.selector.matchLabels.release"
    value = var.prometheus_release
  }

  set {
    name  = "blackbox.enabled"
    value = var.blackbox_enabled
  }
}

