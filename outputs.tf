output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.name
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = module.acr.login_server
}

output "acr_name" {
  description = "ACR name"
  value       = module.acr.acr_name
}

output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = module.aks.cluster_name
}

output "get_credentials_command" {
  description = "Command to configure kubectl"
  value       = module.aks.get_credentials_command
}