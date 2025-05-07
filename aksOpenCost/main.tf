terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
  }
}

resource "helm_release" "opencost" {
  name       = var.release_name
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version
  namespace  = var.namespace

  values = [
    file("${path.module}/opencost-values.yaml")
  ]
}

resource "kubectl_manifest" "service_key" {
  yaml_body = templatefile("${path.module}/secret-key.yaml", {
    secret_key      = var.secret_key
    app_id          = var.app_id
    tenant_id       = var.tenant_id
    subscription_id = var.subscription_id
  })
}

# # Provide Executable Permision to install_kustomize.sh
# resource "null_resource" "chmod_kustomize" {
#   provisioner "local-exec" {
#     command = "chmod +x ../../modules/aksOpenCost/kustomization/install_kustomize.sh"
#   }
# }

# resource "null_resource" "install_kustomize" {
#   depends_on = [null_resource.chmod_kustomize]

#   provisioner "local-exec" {
#     command = "../../modules/aksOpenCost/kustomization/install_kustomize.sh"
#   }
# }

# resource "null_resource" "apply_kustomize" {
#   depends_on = [null_resource.install_kustomize]
#   provisioner "local-exec" {
#     command = " kubectl apply -k ${path.module}/kustomization/kustomization.yaml"
#   }

# }


