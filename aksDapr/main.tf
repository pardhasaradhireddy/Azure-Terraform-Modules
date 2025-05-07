resource "helm_release" "this" {
  name             = var.release_name
  repository       = "https://dapr.github.io/helm-charts/"
  chart            = "dapr"
  version          = var.helm_version
  namespace        = var.namespace
  create_namespace = "true"

  values = [
    file("${path.module}/custom_values.yaml")
  ]
}