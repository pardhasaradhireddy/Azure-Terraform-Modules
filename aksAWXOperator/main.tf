resource "helm_release" "this" {
  name             = var.release_name
  repository       = "https://ansible-community.github.io/awx-operator-helm/"
  chart            = "awx-operator"
  version          = var.helm_version
  namespace        = var.namespace
  create_namespace = false

  values = [
    file("${path.module}/${var.environment}_values.yaml")
  ]
}