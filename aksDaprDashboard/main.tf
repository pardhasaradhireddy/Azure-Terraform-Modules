resource "helm_release" "this" {
  name       = var.release_name
  repository = "https://dapr.github.io/helm-charts/"
  chart      = "dapr-dashboard"
  version    = var.helm_version
  namespace  = var.namespace

  values = [
    file("${path.module}/${var.environment}_values.yaml")
  ]
}