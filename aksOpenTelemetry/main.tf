resource "helm_release" "this" {
  name       = var.release_name
  repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
  chart      = "opentelemetry-collector"
  version    = var.helm_version
  namespace  = var.namespace

  values = [
    file("${path.module}/custom_values.yaml")
  ]

  set {
    name  = "mode"
    value = "statefulset"
  }

  set {
    name  = "image.repository"
    value = "otel/opentelemetry-collector-k8s"
  }
}