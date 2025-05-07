resource "kubernetes_secret" "secret" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  binary_data = var.binary_data

  type = var.type
}
