resource "azurerm_windows_function_app" "windows_function_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  site_config {
    always_on                              = lookup(var.site_config, "always_on", null)
    api_definition_url                     = lookup(var.site_config, "api_definition_url", null)
    api_management_api_id                  = lookup(var.site_config, "api_management_api_id", null)
    app_command_line                       = lookup(var.site_config, "app_command_line", null)
    app_scale_limit                        = lookup(var.site_config, "app_scale_limit", null)
    application_insights_connection_string = lookup(var.site_config, "application_insights_connection_string", null)
    application_insights_key               = lookup(var.site_config, "application_insights_key", null)
    dynamic "application_stack" {
      for_each = length(keys(lookup(var.site_config, "application_stack", {}))) == 0 ? {} : lookup(var.site_config, "application_stack", {})
      content {
        java_version                = lookup(var.site_config.application_stack, "java_version", null)
        dotnet_version              = lookup(var.site_config.application_stack, "dotnet_version", null)
        use_dotnet_isolated_runtime = lookup(var.site_config.application_stack, "use_dotnet_isolated_runtime", null)
        node_version                = lookup(var.site_config.application_stack, "node_version", null)
        powershell_core_version     = lookup(var.site_config.application_stack, "powershell_core_version", null)
        use_custom_runtime          = lookup(var.site_config.application_stack, "use_custom_runtime", null)
      }
    }
    dynamic "app_service_logs" {
      for_each = length(keys(lookup(var.app_settings, "app_service_logs", {}))) == 0 ? {} : lookup(var.app_settings, "app_service_logs", {})
      content {
        disk_quota_mb         = lookup(app_service_logs.logs, "disk_quota_mb", null)
        retention_period_days = lookup(app_service_logs.logs, "retention_period_days", null)
      }
    }
    dynamic "cors" {
      for_each = lookup(var.site_config, "cors", null) != null ? ["cors"] : []
      content {
        allowed_origins     = lookup(var.site_config.cors, "allowed_origins", null)
        support_credentials = lookup(var.site_config.cors, "support_credentials", null)
      }
    }
    default_documents                 = lookup(var.site_config, "default_documents", null)
    elastic_instance_minimum          = lookup(var.site_config, "elastic_instance_minimum", null)
    ftps_state                        = lookup(var.site_config, "ftps_state", null)
    health_check_path                 = lookup(var.site_config, "health_check_path", null)
    health_check_eviction_time_in_min = lookup(var.site_config, "health_check_eviction_time_in_min", null)
    http2_enabled                     = lookup(var.site_config, "http2_enabled", false)

    dynamic "ip_restriction" {
      for_each = length(keys(lookup(var.site_config, "ip_restriction", {}))) == 0 ? {} : lookup(var.site_config, "ip_restriction", {})
      content {
        action                    = lookup(var.site_config.ip_restriction, "action", null)
        headers                   = lookup(var.site_config.ip_restriction, "headers", null)
        ip_address                = lookup(var.site_config.ip_restriction, "ip_address", null)
        name                      = lookup(var.site_config.ip_restriction, "name", null)
        priority                  = lookup(var.site_config.ip_restriction, "priority", null)
        service_tag               = lookup(var.site_config.ip_restriction, "service_tag", null)
        virtual_network_subnet_id = lookup(var.site_config.ip_restriction, "virtual_network_subnet_id", null)
      }
    }

    load_balancing_mode              = lookup(var.site_config, "load_balancing_mode", null)
    managed_pipeline_mode            = lookup(var.site_config, "managed_pipeline_mode", null)
    minimum_tls_version              = lookup(var.site_config, "minimum_tls_version", null)
    pre_warmed_instance_count        = lookup(var.site_config, "pre_warmed_instance_count", null)
    remote_debugging_enabled         = lookup(var.site_config, "remote_debugging_enabled", null)
    remote_debugging_version         = lookup(var.site_config, "remote_debugging_version", null)
    runtime_scale_monitoring_enabled = lookup(var.site_config, "runtime_scale_monitoring_enabled", null)

    dynamic "scm_ip_restriction" {
      for_each = length(keys(lookup(var.site_config, "scm_ip_restriction", {}))) == 0 ? {} : lookup(var.site_config, "scm_ip_restriction", {})
      content {
        action                    = lookup(var.site_config.scm_ip_restriction, "action", null)
        headers                   = lookup(var.site_config.scm_ip_restriction, "headers", null)
        ip_address                = lookup(var.site_config.scm_ip_restriction, "ip_address", null)
        name                      = lookup(var.site_config.scm_ip_restriction, "name", null)
        priority                  = lookup(var.site_config.scm_ip_restriction, "priority", null)
        service_tag               = lookup(var.site_config.scm_ip_restriction, "service_tag", null)
        virtual_network_subnet_id = lookup(var.site_config.scm_ip_restriction, "virtual_network_subnet_id", null)
      }
    }

    scm_minimum_tls_version     = lookup(var.site_config, "scm_minimum_tls_version", null)
    scm_use_main_ip_restriction = lookup(var.site_config, "scm_use_main_ip_restriction", null)
    use_32_bit_worker           = lookup(var.site_config, "use_32_bit_worker", null)
    vnet_route_all_enabled      = lookup(var.site_config, "vnet_route_all_enabled", null)
    websockets_enabled          = lookup(var.site_config, "websockets_enabled", null)
    worker_count                = lookup(var.site_config, "worker_count", null)
  }

  app_settings = var.app_settings

  auth_settings {
    enabled = lookup(var.auth_settings, "enabled", false)
    dynamic "active_directory" {
      for_each = length(keys(lookup(var.auth_settings, "active_directory", {}))) == 0 ? [] : lookup(var.auth_settings, "active_directory")
      content {
        client_id                  = active_directory.value.client_id
        allowed_audiences          = lookup(active_directory.value.active_directory, "allowed_audiences", null)
        client_secret              = lookup(active_directory.value.active_directory, "client_secret", null)
        client_secret_setting_name = lookup(active_directory.value.active_directory, "client_secret_setting_name", null)
      }
    }

    additional_login_parameters    = lookup(var.auth_settings, "additional_login_parameters", null)
    allowed_external_redirect_urls = lookup(var.auth_settings, "allowed_external_redirect_urls", null)
    default_provider               = lookup(var.auth_settings, "default_provider", null)
    issuer                         = lookup(var.auth_settings, "issuer", null)
    runtime_version                = lookup(var.auth_settings, "runtime_version", null)
    token_refresh_extension_hours  = lookup(var.auth_settings, "token_refresh_extension_hours", null)
    token_store_enabled            = lookup(var.auth_settings, "token_store_enabled", null)
    unauthenticated_client_action  = lookup(var.auth_settings, "unauthenticated_client_action", null)
  }

  dynamic "backup" {
    for_each = try(var.backup, {})
    content {
      name = var.backup.name
      dynamic "schedule" {
        for_each = length(keys(lookup(var.backup, "schedule", {}))) == 0 ? {} : lookup(var.backup, "schedule", {})
        content {
          frequency_interval       = var.backup.schedule.frequency_interval
          frequency_unit           = var.backup.schedule.frequency_unit
          keep_at_least_one_backup = lookup(var.backup.schedule, "keep_at_least_one_backup", null)
          retention_period_days    = lookup(var.backup.schedule, "retention_period_days", null)
          start_time               = lookup(var.backup.schedule, "start_time", null)
        }
      }
      storage_account_url = var.backup.schedule.storage_account_url
      enabled             = lookup(var.backup.schedule, "enabled", null)
    }
  }

  builtin_logging_enabled            = var.builtin_logging_enabled
  client_certificate_enabled         = var.client_certificate_enabled
  client_certificate_mode            = var.client_certificate_mode
  client_certificate_exclusion_paths = var.client_certificate_exclusion_paths

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name  = connection_string.value.name
      value = connection_string.value.value
      type  = connection_string.value.type
    }
  }
  content_share_force_disabled = var.content_share_force_disabled
  daily_memory_time_quota      = var.daily_memory_time_quota
  enabled                      = var.enabled
  functions_extension_version  = var.functions_extension_version
  https_only                   = var.https_only
  identity {
    type         = var.identity.type
    identity_ids = var.identity.type == "UserAssigned" ? var.identity.identity_ids : null
  }
  key_vault_reference_identity_id = var.key_vault_reference_identity_id

  dynamic "storage_account" {
    for_each = try(var.storage_account, {})
    content {
      access_key   = storage_account.value.access_key
      account_name = storage_account.value.account_name
      name         = storage_account.value.name
      share_name   = storage_account.value.share_name
      type         = storage_account.value.type
      mount_path   = lookup(storage_account.value, "mount_path", null)
    }
  }

  dynamic "sticky_settings" {
    for_each = try(var.sticky_settings, {})
    content {
      app_setting_names       = lookup(var.sticky_settings, "app_setting_names", null)
      connection_string_names = lookup(var.sticky_settings, "connection_string_names", null)
    }
  }

  storage_account_access_key    = var.storage_account_access_key
  storage_account_name          = var.storage_account_name
  storage_uses_managed_identity = var.storage_uses_managed_identity
  storage_key_vault_secret_id   = var.storage_key_vault_secret_id
  tags                          = var.tags
  virtual_network_subnet_id     = var.virtual_network_subnet_id
}
