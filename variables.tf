variable "hdinsight_spark_clusters" {
  description = <<EOT
Map of hdinsight_spark_clusters, attributes below
Required:
    - cluster_version
    - location
    - name
    - resource_group_name
    - tier
    - component_version (block):
        - spark (required)
    - gateway (block):
        - password (required)
        - username (required)
    - roles (block):
        - head_node (required, block):
            - password (optional)
            - script_actions (optional, block):
                - name (required)
                - parameters (optional)
                - uri (required)
            - ssh_keys (optional)
            - subnet_id (optional)
            - username (required)
            - virtual_network_id (optional)
            - vm_size (required)
        - worker_node (required, block):
            - autoscale (optional, block):
                - capacity (optional, block):
                    - max_instance_count (required)
                    - min_instance_count (required)
                - recurrence (optional, block):
                    - schedule (required, block):
                        - days (required)
                        - target_instance_count (required)
                        - time (required)
                    - timezone (required)
            - password (optional)
            - script_actions (optional, block):
                - name (required)
                - parameters (optional)
                - uri (required)
            - ssh_keys (optional)
            - subnet_id (optional)
            - target_instance_count (required)
            - username (required)
            - virtual_network_id (optional)
            - vm_size (required)
        - zookeeper_node (required, block):
            - password (optional)
            - script_actions (optional, block):
                - name (required)
                - parameters (optional)
                - uri (required)
            - ssh_keys (optional)
            - subnet_id (optional)
            - username (required)
            - virtual_network_id (optional)
            - vm_size (required)
Optional:
    - encryption_in_transit_enabled
    - tags
    - tls_min_version
    - zones
    - compute_isolation (block):
        - compute_isolation_enabled (optional)
        - host_sku (optional)
    - disk_encryption (block):
        - encryption_algorithm (optional)
        - encryption_at_host_enabled (optional)
        - key_vault_key_id (optional)
        - key_vault_managed_identity_id (optional)
    - extension (block):
        - log_analytics_workspace_id (required)
        - primary_key (required)
    - metastores (block):
        - ambari (optional, block):
            - database_name (required)
            - password (required)
            - server (required)
            - username (required)
        - hive (optional, block):
            - database_name (required)
            - password (required)
            - server (required)
            - username (required)
        - oozie (optional, block):
            - database_name (required)
            - password (required)
            - server (required)
            - username (required)
    - monitor (block):
        - log_analytics_workspace_id (required)
        - primary_key (required)
    - network (block):
        - connection_direction (optional)
        - private_link_enabled (optional)
    - private_link_configuration (block):
        - group_id (required)
        - ip_configuration (required, block):
            - name (required)
            - primary (optional)
            - private_ip_address (optional)
            - private_ip_allocation_method (optional)
            - subnet_id (optional)
        - name (required)
    - security_profile (block):
        - aadds_resource_id (required)
        - cluster_users_group_dns (optional)
        - domain_name (required)
        - domain_user_password (required)
        - domain_username (required)
        - ldaps_urls (required)
        - msi_resource_id (required)
    - storage_account (block):
        - is_default (required)
        - storage_account_key (required)
        - storage_container_id (required)
        - storage_resource_id (optional)
    - storage_account_gen2 (block):
        - filesystem_id (required)
        - is_default (required)
        - managed_identity_resource_id (required)
        - storage_resource_id (required)
EOT

  type = map(object({
    cluster_version               = string
    location                      = string
    name                          = string
    resource_group_name           = string
    tier                          = string
    encryption_in_transit_enabled = optional(bool)
    tags                          = optional(map(string))
    tls_min_version               = optional(string)
    zones                         = optional(set(string))
    component_version = object({
      spark = string
    })
    gateway = object({
      password = string
      username = string
    })
    roles = object({
      head_node = object({
        password = optional(string)
        script_actions = optional(list(object({
          name       = string
          parameters = optional(string)
          uri        = string
        })))
        ssh_keys           = optional(set(string))
        subnet_id          = optional(string)
        username           = string
        virtual_network_id = optional(string)
        vm_size            = string
      })
      worker_node = object({
        autoscale = optional(object({
          capacity = optional(object({
            max_instance_count = number
            min_instance_count = number
          }))
          recurrence = optional(object({
            schedule = list(object({
              days                  = list(string)
              target_instance_count = number
              time                  = string
            }))
            timezone = string
          }))
        }))
        password = optional(string)
        script_actions = optional(list(object({
          name       = string
          parameters = optional(string)
          uri        = string
        })))
        ssh_keys              = optional(set(string))
        subnet_id             = optional(string)
        target_instance_count = number
        username              = string
        virtual_network_id    = optional(string)
        vm_size               = string
      })
      zookeeper_node = object({
        password = optional(string)
        script_actions = optional(list(object({
          name       = string
          parameters = optional(string)
          uri        = string
        })))
        ssh_keys           = optional(set(string))
        subnet_id          = optional(string)
        username           = string
        virtual_network_id = optional(string)
        vm_size            = string
      })
    })
    compute_isolation = optional(object({
      compute_isolation_enabled = optional(bool) # Default: false
      host_sku                  = optional(string)
    }))
    disk_encryption = optional(object({
      encryption_algorithm          = optional(string)
      encryption_at_host_enabled    = optional(bool)
      key_vault_key_id              = optional(string)
      key_vault_managed_identity_id = optional(string)
    }))
    extension = optional(object({
      log_analytics_workspace_id = string
      primary_key                = string
    }))
    metastores = optional(object({
      ambari = optional(object({
        database_name = string
        password      = string
        server        = string
        username      = string
      }))
      hive = optional(object({
        database_name = string
        password      = string
        server        = string
        username      = string
      }))
      oozie = optional(object({
        database_name = string
        password      = string
        server        = string
        username      = string
      }))
    }))
    monitor = optional(object({
      log_analytics_workspace_id = string
      primary_key                = string
    }))
    network = optional(object({
      connection_direction = optional(string) # Default: "Inbound"
      private_link_enabled = optional(bool)   # Default: false
    }))
    private_link_configuration = optional(object({
      group_id = string
      ip_configuration = object({
        name                         = string
        primary                      = optional(bool)
        private_ip_address           = optional(string)
        private_ip_allocation_method = optional(string)
        subnet_id                    = optional(string)
      })
      name = string
    }))
    security_profile = optional(object({
      aadds_resource_id       = string
      cluster_users_group_dns = optional(set(string))
      domain_name             = string
      domain_user_password    = string
      domain_username         = string
      ldaps_urls              = set(string)
      msi_resource_id         = string
    }))
    storage_account = optional(object({
      is_default           = bool
      storage_account_key  = string
      storage_container_id = string
      storage_resource_id  = optional(string)
    }))
    storage_account_gen2 = optional(object({
      filesystem_id                = string
      is_default                   = bool
      managed_identity_resource_id = string
      storage_resource_id          = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.hdinsight_spark_clusters : (
        v.roles.head_node.script_actions == null || (length(v.roles.head_node.script_actions) >= 1)
      )
    ])
    error_message = "Each script_actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.hdinsight_spark_clusters : (
        length(v.roles.worker_node.autoscale.recurrence.schedule) >= 1
      )
    ])
    error_message = "Each schedule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.hdinsight_spark_clusters : (
        v.roles.worker_node.script_actions == null || (length(v.roles.worker_node.script_actions) >= 1)
      )
    ])
    error_message = "Each script_actions list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.hdinsight_spark_clusters : (
        v.roles.zookeeper_node.script_actions == null || (length(v.roles.zookeeper_node.script_actions) >= 1)
      )
    ])
    error_message = "Each script_actions list must contain at least 1 items"
  }
}

