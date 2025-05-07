resource "kubernetes_secret" "secret" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data        = lookup(each.value, "data", null)
  binary_data = lookup(each.value, "binary_data", null)
  type        = var.type
}