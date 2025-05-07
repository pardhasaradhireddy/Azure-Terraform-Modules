#--------------------
# Kubernetes Secrets
#--------------------
resource "kubernetes_secret" "secret" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  data        = try(var.data, null)
  binary_data = try(var.binary_data, null)
  type        = try(var.type, "Opaque")

  lifecycle {
    ignore_changes = [
      binary_data,
    ]
  }
}