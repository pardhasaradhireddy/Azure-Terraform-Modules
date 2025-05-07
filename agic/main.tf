locals {
  client_json = {
    clientId                       = var.client_id
    clientSecret                   = var.client_secret
    subscriptionId                 = var.subscription_id
    tenantId                       = var.tenant_id
    activeDirectoryEndpointUrl     = "https://login.microsoftonline.com"
    resourceManagerEndpointUrl     = "https://management.azure.com/"
    activeDirectoryGraphResourceId = "https://graph.windows.net/"
    sqlManagementEndpointUrl       = "https://management.core.windows.net:8443/"
    galleryEndpointUrl             = "https://gallery.azure.com/"
    managementEndpointUrl          = "https://management.core.windows.net/"
  }
}

resource "helm_release" "aks_agic" {
  name             = var.agic_release_name
  repository       = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart            = "ingress-azure"
  version          = "1.5.1"
  create_namespace = "true"
  namespace        = "agic"
  reuse_values     = true

  set {
    name  = "appgw.subscriptionId"
    value = var.subscription_id
  }

  set {
    name  = "appgw.resourceGroup"
    value = var.aks_app_gateway_rg_name
  }

  set {
    name  = "appgw.name"
    value = var.aks_app_gateway_name
  }

  set {
    name  = "armAuth.type"
    value = "servicePrincipal"
  }

  set_sensitive {
    name  = "armAuth.identityClientID"
    value = var.client_id
  }

  set_sensitive {
    name  = "armAuth.secretJSON"
    value = base64encode(jsonencode(local.client_json))
  }
}