#--------------------------
# Azure Kubernetes Cluster
#--------------------------
output "cluster_id" {
  description = "The Kubernetes Managed Cluster ID."
  value       = azurerm_kubernetes_cluster.k8s.id
}

output "cluster_name" {
  description = "The Kubernetes Managed Cluster Name."
  value       = azurerm_kubernetes_cluster.k8s.name
}

output "current_kubernetes_version" {
  description = "The current version running on the Azure Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.k8s.current_kubernetes_version
}

output "fqdn" {
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.k8s.fqdn
}

output "private_fqdn" {
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.k8s.private_fqdn
}

output "portal_fqdn" {
  description = "The FQDN for the Azure Portal resources when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.k8s.portal_fqdn
}

output "kube_admin_config" {
  description = "A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled."
  value       = azurerm_kubernetes_cluster.k8s.kube_admin_config
  sensitive   = true
}

output "kube_config" {
  description = "A kube_config block as defined below."
  value       = azurerm_kubernetes_cluster.k8s.kube_config
  sensitive   = true
}

output "cluster_host" {
  description = "The Kubernetes cluster server host."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.host
  sensitive   = true
}

output "client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
  sensitive   = true
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
}

output "http_application_routing_zone_name" {
  description = "The Zone Name of the HTTP Application Routing."
  value       = azurerm_kubernetes_cluster.k8s.http_application_routing_zone_name
}

output "kubelet_identity_clientID" {
  description = "The Client ID of the user-defined Managed Identity to be assigned to the Kubelets."
  value       = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].client_id
}

output "kubelet_identity_objectID" {
  description = "The Object ID of the user-defined Managed Identity assigned to the Kubelets."
  value       = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}

output "keyvault_identity_clientID" {
  description = "The Client ID of the user-defined Managed Identity used by the Secret Provider."
  value       = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider[0].secret_identity[0].client_id
}

output "keyvault_identity_objectID" {
  description = "The Object ID of the user-defined Managed Identity used by the Secret Provider."
  value       = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider[0].secret_identity[0].object_id
}

output "oidc_issuer_url" {
  description = "The OIDC issuer URL that is associated with the cluster."
  value       = azurerm_kubernetes_cluster.k8s.oidc_issuer_url
}

output "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.k8s.node_resource_group
}

output "node_resource_group_id" {
  description = "The ID of the Resource Group containing the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.k8s.node_resource_group_id
}

output "network_profile" {
  description = "A network_profile block as defined below."
  value       = azurerm_kubernetes_cluster.k8s.network_profile
  sensitive   = true
}

output "ingress_application_gateway" {
  description = "A ingress_application_gateway block as defined below."
  value       = azurerm_kubernetes_cluster.k8s.ingress_application_gateway
  sensitive   = true
}

output "oms_agent" {
  description = "A oms_agent block as defined below."
  value       = azurerm_kubernetes_cluster.k8s.oms_agent
  sensitive   = true
}

output "key_vault_secrets_provider" {
  description = "A key_vault_secrets_provider block as defined below."
  value       = azurerm_kubernetes_cluster.k8s.key_vault_secrets_provider
  sensitive   = true
}