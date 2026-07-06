output "hdinsight_spark_clusters" {
  description = "All hdinsight_spark_cluster resources"
  value       = azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters
  sensitive   = true
}
output "hdinsight_spark_clusters_cluster_version" {
  description = "List of cluster_version values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.cluster_version]
}
output "hdinsight_spark_clusters_component_version" {
  description = "List of component_version values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.component_version]
}
output "hdinsight_spark_clusters_compute_isolation" {
  description = "List of compute_isolation values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.compute_isolation]
}
output "hdinsight_spark_clusters_disk_encryption" {
  description = "List of disk_encryption values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.disk_encryption]
}
output "hdinsight_spark_clusters_encryption_in_transit_enabled" {
  description = "List of encryption_in_transit_enabled values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.encryption_in_transit_enabled]
}
output "hdinsight_spark_clusters_extension" {
  description = "List of extension values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.extension]
  sensitive   = true
}
output "hdinsight_spark_clusters_gateway" {
  description = "List of gateway values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.gateway]
  sensitive   = true
}
output "hdinsight_spark_clusters_https_endpoint" {
  description = "List of https_endpoint values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.https_endpoint]
}
output "hdinsight_spark_clusters_location" {
  description = "List of location values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.location]
}
output "hdinsight_spark_clusters_metastores" {
  description = "List of metastores values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.metastores]
  sensitive   = true
}
output "hdinsight_spark_clusters_monitor" {
  description = "List of monitor values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.monitor]
  sensitive   = true
}
output "hdinsight_spark_clusters_name" {
  description = "List of name values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.name]
}
output "hdinsight_spark_clusters_network" {
  description = "List of network values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.network]
}
output "hdinsight_spark_clusters_private_link_configuration" {
  description = "List of private_link_configuration values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.private_link_configuration]
}
output "hdinsight_spark_clusters_resource_group_name" {
  description = "List of resource_group_name values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.resource_group_name]
}
output "hdinsight_spark_clusters_roles" {
  description = "List of roles values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.roles]
  sensitive   = true
}
output "hdinsight_spark_clusters_security_profile" {
  description = "List of security_profile values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.security_profile]
  sensitive   = true
}
output "hdinsight_spark_clusters_ssh_endpoint" {
  description = "List of ssh_endpoint values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.ssh_endpoint]
}
output "hdinsight_spark_clusters_storage_account" {
  description = "List of storage_account values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.storage_account]
  sensitive   = true
}
output "hdinsight_spark_clusters_storage_account_gen2" {
  description = "List of storage_account_gen2 values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.storage_account_gen2]
}
output "hdinsight_spark_clusters_tags" {
  description = "List of tags values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.tags]
}
output "hdinsight_spark_clusters_tier" {
  description = "List of tier values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.tier]
}
output "hdinsight_spark_clusters_tls_min_version" {
  description = "List of tls_min_version values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.tls_min_version]
}
output "hdinsight_spark_clusters_zones" {
  description = "List of zones values across all hdinsight_spark_clusters"
  value       = [for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : v.zones]
}

