resource "kubernetes_config_map" "config_map" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data = var.data
}