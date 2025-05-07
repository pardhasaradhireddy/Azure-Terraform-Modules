resource "helm_release" "azureappconfiguration" {
  name      = var.app_configuration_name
  chart     = "oci://mcr.microsoft.com/azure-app-configuration/helmchart/kubernetes-provider"
  namespace = var.namespace
}

