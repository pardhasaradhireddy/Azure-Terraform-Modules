output "kubecost_release_status" {
  description = "Status of the deployed KubeCost Helm release"
  value       = helm_release.kubecost.status
}

output "kubecost_release_info" {
  description = "Information about the deployed KubeCost Helm release"
  value       = helm_release.kubecost
}
