resource "azurerm_hdinsight_spark_cluster" "hdinsight_spark_clusters" {
  for_each = var.hdinsight_spark_clusters

  cluster_version               = each.value.cluster_version
  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  tier                          = each.value.tier
  encryption_in_transit_enabled = each.value.encryption_in_transit_enabled
  tags                          = each.value.tags
  tls_min_version               = each.value.tls_min_version
  zones                         = each.value.zones

  component_version {
    spark = each.value.component_version.spark
  }

  gateway {
    password = each.value.gateway.password
    username = each.value.gateway.username
  }

  roles {
    head_node {
      password = each.value.roles.head_node.password
      dynamic "script_actions" {
        for_each = each.value.roles.head_node.script_actions != null ? each.value.roles.head_node.script_actions : []
        content {
          name       = script_actions.value.name
          parameters = script_actions.value.parameters
          uri        = script_actions.value.uri
        }
      }
      ssh_keys           = each.value.roles.head_node.ssh_keys
      subnet_id          = each.value.roles.head_node.subnet_id
      username           = each.value.roles.head_node.username
      virtual_network_id = each.value.roles.head_node.virtual_network_id
      vm_size            = each.value.roles.head_node.vm_size
    }
    worker_node {
      dynamic "autoscale" {
        for_each = each.value.roles.worker_node.autoscale != null ? [each.value.roles.worker_node.autoscale] : []
        content {
          dynamic "capacity" {
            for_each = autoscale.value.capacity != null ? [autoscale.value.capacity] : []
            content {
              max_instance_count = capacity.value.max_instance_count
              min_instance_count = capacity.value.min_instance_count
            }
          }
          dynamic "recurrence" {
            for_each = autoscale.value.recurrence != null ? [autoscale.value.recurrence] : []
            content {
              dynamic "schedule" {
                for_each = recurrence.value.schedule
                content {
                  days                  = schedule.value.days
                  target_instance_count = schedule.value.target_instance_count
                  time                  = schedule.value.time
                }
              }
              timezone = recurrence.value.timezone
            }
          }
        }
      }
      password = each.value.roles.worker_node.password
      dynamic "script_actions" {
        for_each = each.value.roles.worker_node.script_actions != null ? each.value.roles.worker_node.script_actions : []
        content {
          name       = script_actions.value.name
          parameters = script_actions.value.parameters
          uri        = script_actions.value.uri
        }
      }
      ssh_keys              = each.value.roles.worker_node.ssh_keys
      subnet_id             = each.value.roles.worker_node.subnet_id
      target_instance_count = each.value.roles.worker_node.target_instance_count
      username              = each.value.roles.worker_node.username
      virtual_network_id    = each.value.roles.worker_node.virtual_network_id
      vm_size               = each.value.roles.worker_node.vm_size
    }
    zookeeper_node {
      password = each.value.roles.zookeeper_node.password
      dynamic "script_actions" {
        for_each = each.value.roles.zookeeper_node.script_actions != null ? each.value.roles.zookeeper_node.script_actions : []
        content {
          name       = script_actions.value.name
          parameters = script_actions.value.parameters
          uri        = script_actions.value.uri
        }
      }
      ssh_keys           = each.value.roles.zookeeper_node.ssh_keys
      subnet_id          = each.value.roles.zookeeper_node.subnet_id
      username           = each.value.roles.zookeeper_node.username
      virtual_network_id = each.value.roles.zookeeper_node.virtual_network_id
      vm_size            = each.value.roles.zookeeper_node.vm_size
    }
  }

  dynamic "compute_isolation" {
    for_each = each.value.compute_isolation != null ? [each.value.compute_isolation] : []
    content {
      compute_isolation_enabled = compute_isolation.value.compute_isolation_enabled
      host_sku                  = compute_isolation.value.host_sku
    }
  }

  dynamic "disk_encryption" {
    for_each = each.value.disk_encryption != null ? [each.value.disk_encryption] : []
    content {
      encryption_algorithm          = disk_encryption.value.encryption_algorithm
      encryption_at_host_enabled    = disk_encryption.value.encryption_at_host_enabled
      key_vault_key_id              = disk_encryption.value.key_vault_key_id
      key_vault_managed_identity_id = disk_encryption.value.key_vault_managed_identity_id
    }
  }

  dynamic "extension" {
    for_each = each.value.extension != null ? [each.value.extension] : []
    content {
      log_analytics_workspace_id = extension.value.log_analytics_workspace_id
      primary_key                = extension.value.primary_key
    }
  }

  dynamic "metastores" {
    for_each = each.value.metastores != null ? [each.value.metastores] : []
    content {
      dynamic "ambari" {
        for_each = metastores.value.ambari != null ? [metastores.value.ambari] : []
        content {
          database_name = ambari.value.database_name
          password      = ambari.value.password
          server        = ambari.value.server
          username      = ambari.value.username
        }
      }
      dynamic "hive" {
        for_each = metastores.value.hive != null ? [metastores.value.hive] : []
        content {
          database_name = hive.value.database_name
          password      = hive.value.password
          server        = hive.value.server
          username      = hive.value.username
        }
      }
      dynamic "oozie" {
        for_each = metastores.value.oozie != null ? [metastores.value.oozie] : []
        content {
          database_name = oozie.value.database_name
          password      = oozie.value.password
          server        = oozie.value.server
          username      = oozie.value.username
        }
      }
    }
  }

  dynamic "monitor" {
    for_each = each.value.monitor != null ? [each.value.monitor] : []
    content {
      log_analytics_workspace_id = monitor.value.log_analytics_workspace_id
      primary_key                = monitor.value.primary_key
    }
  }

  dynamic "network" {
    for_each = each.value.network != null ? [each.value.network] : []
    content {
      connection_direction = network.value.connection_direction
      private_link_enabled = network.value.private_link_enabled
    }
  }

  dynamic "private_link_configuration" {
    for_each = each.value.private_link_configuration != null ? [each.value.private_link_configuration] : []
    content {
      group_id = private_link_configuration.value.group_id
      ip_configuration {
        name                         = private_link_configuration.value.ip_configuration.name
        primary                      = private_link_configuration.value.ip_configuration.primary
        private_ip_address           = private_link_configuration.value.ip_configuration.private_ip_address
        private_ip_allocation_method = private_link_configuration.value.ip_configuration.private_ip_allocation_method
        subnet_id                    = private_link_configuration.value.ip_configuration.subnet_id
      }
      name = private_link_configuration.value.name
    }
  }

  dynamic "security_profile" {
    for_each = each.value.security_profile != null ? [each.value.security_profile] : []
    content {
      aadds_resource_id       = security_profile.value.aadds_resource_id
      cluster_users_group_dns = security_profile.value.cluster_users_group_dns
      domain_name             = security_profile.value.domain_name
      domain_user_password    = security_profile.value.domain_user_password
      domain_username         = security_profile.value.domain_username
      ldaps_urls              = security_profile.value.ldaps_urls
      msi_resource_id         = security_profile.value.msi_resource_id
    }
  }

  dynamic "storage_account" {
    for_each = each.value.storage_account != null ? [each.value.storage_account] : []
    content {
      is_default           = storage_account.value.is_default
      storage_account_key  = storage_account.value.storage_account_key
      storage_container_id = storage_account.value.storage_container_id
      storage_resource_id  = storage_account.value.storage_resource_id
    }
  }

  dynamic "storage_account_gen2" {
    for_each = each.value.storage_account_gen2 != null ? [each.value.storage_account_gen2] : []
    content {
      filesystem_id                = storage_account_gen2.value.filesystem_id
      is_default                   = storage_account_gen2.value.is_default
      managed_identity_resource_id = storage_account_gen2.value.managed_identity_resource_id
      storage_resource_id          = storage_account_gen2.value.storage_resource_id
    }
  }
}

