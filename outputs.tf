output "hdinsight_spark_clusters_id" {
  description = "Map of id values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "hdinsight_spark_clusters_cluster_version" {
  description = "Map of cluster_version values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.cluster_version if v.cluster_version != null && length(v.cluster_version) > 0 }
}
output "hdinsight_spark_clusters_component_version" {
  description = "Map of component_version values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.component_version) if v.component_version != null && length(v.component_version) > 0 }
}
output "hdinsight_spark_clusters_compute_isolation" {
  description = "Map of compute_isolation values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.compute_isolation) if v.compute_isolation != null && length(v.compute_isolation) > 0 }
}
output "hdinsight_spark_clusters_disk_encryption" {
  description = "Map of disk_encryption values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.disk_encryption if v.disk_encryption != null && length(v.disk_encryption) > 0 }
}
output "hdinsight_spark_clusters_encryption_in_transit_enabled" {
  description = "Map of encryption_in_transit_enabled values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.encryption_in_transit_enabled if v.encryption_in_transit_enabled != null }
}
output "hdinsight_spark_clusters_extension" {
  description = "Map of extension values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.extension) if v.extension != null && length(v.extension) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_gateway" {
  description = "Map of gateway values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.gateway) if v.gateway != null && length(v.gateway) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_https_endpoint" {
  description = "Map of https_endpoint values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.https_endpoint if v.https_endpoint != null && length(v.https_endpoint) > 0 }
}
output "hdinsight_spark_clusters_location" {
  description = "Map of location values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.location if v.location != null && length(v.location) > 0 }
}
output "hdinsight_spark_clusters_metastores" {
  description = "Map of metastores values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.metastores) if v.metastores != null && length(v.metastores) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_monitor" {
  description = "Map of monitor values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.monitor) if v.monitor != null && length(v.monitor) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_name" {
  description = "Map of name values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "hdinsight_spark_clusters_network" {
  description = "Map of network values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.network) if v.network != null && length(v.network) > 0 }
}
output "hdinsight_spark_clusters_private_link_configuration" {
  description = "Map of private_link_configuration values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.private_link_configuration) if v.private_link_configuration != null && length(v.private_link_configuration) > 0 }
}
output "hdinsight_spark_clusters_resource_group_name" {
  description = "Map of resource_group_name values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "hdinsight_spark_clusters_roles" {
  description = "Map of roles values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.roles) if v.roles != null && length(v.roles) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_security_profile" {
  description = "Map of security_profile values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.security_profile) if v.security_profile != null && length(v.security_profile) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_ssh_endpoint" {
  description = "Map of ssh_endpoint values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.ssh_endpoint if v.ssh_endpoint != null && length(v.ssh_endpoint) > 0 }
}
output "hdinsight_spark_clusters_storage_account" {
  description = "Map of storage_account values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.storage_account if v.storage_account != null && length(v.storage_account) > 0 }
  sensitive   = true
}
output "hdinsight_spark_clusters_storage_account_gen2" {
  description = "Map of storage_account_gen2 values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => one(v.storage_account_gen2) if v.storage_account_gen2 != null && length(v.storage_account_gen2) > 0 }
}
output "hdinsight_spark_clusters_tags" {
  description = "Map of tags values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "hdinsight_spark_clusters_tier" {
  description = "Map of tier values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.tier if v.tier != null && length(v.tier) > 0 }
}
output "hdinsight_spark_clusters_tls_min_version" {
  description = "Map of tls_min_version values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.tls_min_version if v.tls_min_version != null && length(v.tls_min_version) > 0 }
}
output "hdinsight_spark_clusters_zones" {
  description = "Map of zones values across all hdinsight_spark_clusters, keyed the same as var.hdinsight_spark_clusters"
  value       = { for k, v in azurerm_hdinsight_spark_cluster.hdinsight_spark_clusters : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

