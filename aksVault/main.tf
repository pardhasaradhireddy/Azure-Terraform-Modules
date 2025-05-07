resource "helm_release" "aks-vault" {
  name             = var.release_name
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  version          = var.chart_version
  create_namespace = "true"
  namespace        = "vault"

  values = [
    file("${path.module}/${var.environment}_values.yaml")
  ]
}