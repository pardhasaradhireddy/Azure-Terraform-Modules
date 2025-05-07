resource "helm_release" "this" {
  name             = var.release_name
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  version          = var.helm_version
  namespace        = var.namespace
  create_namespace = "true"
  values = [
    file("${path.module}/custom_values.yaml")
  ]
}