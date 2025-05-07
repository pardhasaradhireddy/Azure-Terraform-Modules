resource "helm_release" "aks-nginx" {
  name             = var.release_name
  repository       = "oci://ghcr.io/nginxinc/charts"
  chart            = "nginx-ingress"
  version          = var.chart_version
  create_namespace = "true"
  namespace        = "nginx-ingress"

  values = [
    file("${path.module}/values.yaml")
  ]
}