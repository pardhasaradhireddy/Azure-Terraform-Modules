#--------------------
# Linux Function App
#--------------------
resource "azurerm_linux_function_app" "linux_function_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  # site_config block begin
  site_config {
    always_on                              = lookup(var.site_config, "always_on", false)
    api_definition_url                     = lookup(var.site_config, "api_definition_url", null)
    api_management_api_id                  = lookup(var.site_config, "api_management_api_id", null)
    app_command_line                       = lookup(var.site_config, "app_command_line", null)
    app_scale_limit                        = lookup(var.site_config, "app_scale_limit", null)
    application_insights_connection_string = lookup(var.site_config, "application_insights_connection_string", null)
    application_insights_key               = lookup(var.site_config, "application_insights_key", null)

    dynamic "application_stack" {
      for_each = lookup(var.site_config, "application_stack", {}) != {} ? [var.site_config.application_stack] : []
      content {
        dynamic "docker" {
          for_each = length(keys(lookup(application_stack.value, "docker", {}))) > 0 ? lookup(application_stack.value, "docker", {}) : {}
          content {
            registry_url      = docker.value.registry_url
            image_name        = docker.value.image_name
            image_tag         = docker.value.image_tag
            registry_username = var.site_config.container_registry_use_managed_identity != true ? docker.value.registry_username : null
            registry_password = var.site_config.container_registry_use_managed_identity != true ? docker.value.registry_password : null
          }
        }
        dotnet_version              = lookup(application_stack.value, "dotnet_version", null)
        use_dotnet_isolated_runtime = lookup(application_stack.value, "use_dotnet_isolated_runtime", null)
        java_version                = lookup(application_stack.value, "java_version", null)
        node_version                = lookup(application_stack.value, "node_version", null)
        python_version              = lookup(application_stack.value, "python_version", null)
        powershell_core_version     = lookup(application_stack.value, "powershell_core_version", null)
        use_custom_runtime          = lookup(application_stack.value, "use_custom_runtime", null)
      }
    }

    dynamic "app_service_logs" {
      for_each = lookup(var.site_config, "app_service_logs", {}) != {} ? [var.site_config.app_service_logs] : []
      content {
        disk_quota_mb         = lookup(app_service_logs.value, "disk_quota_mb", "35")
        retention_period_days = lookup(app_service_logs.value, "retention_period_days", null)
      }
    }

    container_registry_managed_identity_client_id = lookup(var.site_config, "container_registry_managed_identity_client_id", null)
    container_registry_use_managed_identity       = lookup(var.site_config, "container_registry_use_managed_identity", null)

    dynamic "cors" {
      for_each = lookup(var.site_config, "cors", {}) != {} ? [var.site_config.cors] : []
      content {
        allowed_origins     = lookup(cors.value, "allowed_origins", null)
        support_credentials = lookup(cors.value, "support_credentials", false)
      }
    }

    default_documents                 = lookup(var.site_config, "default_documents", null)
    elastic_instance_minimum          = lookup(var.site_config, "elastic_instance_minimum", null)
    ftps_state                        = lookup(var.site_config, "ftps_state", "Disabled")
    health_check_path                 = lookup(var.site_config, "health_check_path", null)
    health_check_eviction_time_in_min = lookup(var.site_config, "health_check_eviction_time_in_min", 10)
    http2_enabled                     = lookup(var.site_config, "http2_enabled", false)

    dynamic "ip_restriction" {
      for_each = length(keys(lookup(var.site_config, "ip_restriction", {}))) > 0 ? lookup(var.site_config, "ip_restriction", {}) : {}
      content {
        action = lookup(ip_restriction.value, "action", "Allow")
        dynamic "headers" {
          for_each = lookup(ip_restriction.value, "headers", {}) != {} ? [ip_restriction.value.headers] : []
          content {
            x_azure_fdid      = lookup(headers.value, "x_azure_fdid", null)
            x_fd_health_probe = lookup(headers.value, "x_fd_health_probe", "1")
            x_forwarded_for   = lookup(headers.value, "x_forwarded_for", null)
            x_forwarded_host  = lookup(headers.value, "x_forwarded_host", null)
          }
        }
        ip_address                = lookup(ip_restriction.value, "ip_address", null) != null && lookup(ip_restriction.value, "service_tag", null) == null && lookup(ip_restriction.value, "virtual_network_subnet_id", null) == null ? lookup(ip_restriction.value, "ip_address", null) : null
        name                      = lookup(ip_restriction.value, "name", null)
        priority                  = lookup(ip_restriction.value, "priority", "65000")
        service_tag               = lookup(ip_restriction.value, "service_tag", null) != null && lookup(ip_restriction.value, "ip_address", null) == null && lookup(ip_restriction.value, "virtual_network_subnet_id", null) == null ? lookup(ip_restriction.value, "service_tag", null) : null
        virtual_network_subnet_id = lookup(ip_restriction.value, "virtual_network_subnet_id", null) != null && lookup(ip_restriction.value, "ip_address", null) == null && lookup(ip_restriction.value, "service_tag", null) == null ? lookup(ip_restriction.value, "virtual_network_subnet_id", null) : null
        description               = lookup(ip_restriction.value, "description", null)
      }
    }

    ip_restriction_default_action    = lookup(var.site_config, "ip_restriction_default_action", "Allow")
    load_balancing_mode              = lookup(var.site_config, "load_balancing_mode", "LeastRequests")
    managed_pipeline_mode            = lookup(var.site_config, "managed_pipeline_mode", "Integrated")
    minimum_tls_version              = lookup(var.site_config, "minimum_tls_version", "1.2")
    pre_warmed_instance_count        = lookup(var.site_config, "pre_warmed_instance_count", null)
    remote_debugging_enabled         = lookup(var.site_config, "remote_debugging_enabled", false)
    remote_debugging_version         = lookup(var.site_config, "remote_debugging_version", null)
    runtime_scale_monitoring_enabled = lookup(var.site_config, "runtime_scale_monitoring_enabled", null)

    dynamic "scm_ip_restriction" {
      for_each = length(keys(lookup(var.site_config, "scm_ip_restriction", {}))) > 0 ? lookup(var.site_config, "scm_ip_restriction", {}) : {}
      content {
        action = lookup(scm_ip_restriction.value, "action", "Allow")
        dynamic "headers" {
          for_each = lookup(scm_ip_restriction.value, "headers", {}) != {} ? [scm_ip_restriction.value.headers] : []
          content {
            x_azure_fdid      = lookup(headers.value, "x_azure_fdid", null)
            x_fd_health_probe = lookup(headers.value, "x_fd_health_probe", "1")
            x_forwarded_for   = lookup(headers.value, "x_forwarded_for", null)
            x_forwarded_host  = lookup(headers.value, "x_forwarded_host", null)
          }
        }
        ip_address                = lookup(scm_ip_restriction.value, "ip_address", null) != null && lookup(scm_ip_restriction.value, "service_tag", null) == null && lookup(scm_ip_restriction.value, "virtual_network_subnet_id", null) == null ? lookup(scm_ip_restriction.value, "ip_address", null) : null
        name                      = lookup(scm_ip_restriction.value, "name", null)
        priority                  = lookup(scm_ip_restriction.value, "priority", 65000)
        service_tag               = lookup(scm_ip_restriction.value, "service_tag", null) != null && lookup(scm_ip_restriction.value, "ip_address", null) == null && lookup(scm_ip_restriction.value, "virtual_network_subnet_id", null) == null ? lookup(scm_ip_restriction.value, "service_tag", null) : null
        virtual_network_subnet_id = lookup(scm_ip_restriction.value, "virtual_network_subnet_id", null) != null && lookup(scm_ip_restriction.value, "ip_address", null) == null && lookup(scm_ip_restriction.value, "service_tag", null) == null ? lookup(scm_ip_restriction.value, "virtual_network_subnet_id", null) : null
        description               = lookup(scm_ip_restriction.value, "description", null)
      }
    }

    scm_ip_restriction_default_action = lookup(var.site_config, "scm_ip_restriction_default_action", "Allow")
    scm_minimum_tls_version           = lookup(var.site_config, "scm_minimum_tls_version", "1.2")
    scm_use_main_ip_restriction       = lookup(var.site_config, "scm_use_main_ip_restriction", null)
    use_32_bit_worker                 = lookup(var.site_config, "use_32_bit_worker", false)
    vnet_route_all_enabled            = lookup(var.site_config, "vnet_route_all_enabled", false)
    websockets_enabled                = lookup(var.site_config, "websockets_enabled", false)
    worker_count                      = lookup(var.site_config, "worker_count", null)
  }
  # site_config block end

  app_settings = try(var.app_settings, {})

  # auth_settings block begin
  dynamic "auth_settings" {
    for_each = try(var.auth_settings, {}) != {} ? [var.auth_settings] : []
    content {
      enabled = auth_settings.value.enabled
      dynamic "active_directory" {
        for_each = lookup(auth_settings.value, "active_directory", {}) != {} ? [auth_settings.value.active_directory] : []
        content {
          client_id                  = active_directory.value.client_id
          allowed_audiences          = lookup(active_directory.value, "allowed_audiences", null)
          client_secret              = lookup(active_directory.value, "client_secret", null)
          client_secret_setting_name = lookup(active_directory.value, "client_secret_setting_name", null)
        }
      }
      additional_login_parameters    = lookup(auth_settings.value, "additional_login_parameters", null)
      allowed_external_redirect_urls = lookup(auth_settings.value, "allowed_external_redirect_urls", null)
      default_provider               = lookup(auth_settings.value, "default_provider", null)
      dynamic "github" {
        for_each = lookup(auth_settings.value, "github", {}) != {} ? [auth_settings.value.github] : []
        content {
          client_id                  = github.value.client_id
          client_secret              = github.value.client_secret_setting_name != null ? lookup(github.value, "client_secret", null) : null
          client_secret_setting_name = github.value.client_secret != null ? lookup(github.value, "client_secret_setting_name", null) : null
          oauth_scopes               = lookup(github.value, "oauth_scopes", null)
        }
      }
      issuer                        = lookup(auth_settings.value, "issuer", null)
      runtime_version               = lookup(auth_settings.value, "runtime_version", null)
      token_refresh_extension_hours = lookup(auth_settings.value, "token_refresh_extension_hours", "72")
      token_store_enabled           = lookup(auth_settings.value, "token_store_enabled", false)
      unauthenticated_client_action = lookup(auth_settings.value, "unauthenticated_client_action", null)
      # @todo Ignored facebook, google, microsoft & twitter blocks inside auth_settings block
    }
  }
  # auth_settings block end

  # auth_settings_v2 block begin
  dynamic "auth_settings_v2" {
    for_each = try(var.auth_settings_v2, {}) != {} ? [var.auth_settings_v2] : []
    content {
      auth_enabled                            = lookup(auth_settings_v2.value, "auth_enabled", false)
      runtime_version                         = lookup(auth_settings_v2.value, "runtime_version", "~1")
      config_file_path                        = lookup(auth_settings_v2.value, "config_file_path", null)
      require_authentication                  = lookup(auth_settings_v2.value, "require_authentication", null)
      unauthenticated_action                  = lookup(auth_settings_v2.value, "unauthenticated_action", "RedirectToLoginPage")
      default_provider                        = lookup(auth_settings_v2.value, "default_provider", null)
      excluded_paths                          = lookup(auth_settings_v2.value, "excluded_paths", null)
      require_https                           = lookup(auth_settings_v2.value, "require_https", true)
      http_route_api_prefix                   = lookup(auth_settings_v2.value, "http_route_api_prefix", "/.auth")
      forward_proxy_convention                = lookup(auth_settings_v2.value, "forward_proxy_convention", "NoProxy")
      forward_proxy_custom_host_header_name   = lookup(auth_settings_v2.value, "forward_proxy_custom_host_header_name", null)
      forward_proxy_custom_scheme_header_name = lookup(auth_settings_v2.value, "forward_proxy_custom_scheme_header_name", null)
      dynamic "active_directory_v2" {
        for_each = lookup(auth_settings_v2.value, "active_directory_v2", {}) != {} ? [auth_settings_v2.value.active_directory_v2] : []
        content {
          client_id                            = active_directory_v2.value.client_id
          tenant_auth_endpoint                 = active_directory_v2.value.tenant_auth_endpoint
          client_secret_setting_name           = lookup(active_directory_v2.value, "client_secret_setting_name", null)
          client_secret_certificate_thumbprint = lookup(active_directory_v2.value, "client_secret_certificate_thumbprint", null)
          jwt_allowed_groups                   = lookup(active_directory_v2.value, "jwt_allowed_groups", null)
          jwt_allowed_client_applications      = lookup(active_directory_v2.value, "jwt_allowed_client_applications", null)
          www_authentication_disabled          = lookup(active_directory_v2.value, "www_authentication_disabled", false)
          allowed_groups                       = lookup(active_directory_v2.value, "allowed_groups", null)
          allowed_identities                   = lookup(active_directory_v2.value, "allowed_identities", null)
          allowed_applications                 = lookup(active_directory_v2.value, "allowed_applications", null)
          login_parameters                     = lookup(active_directory_v2.value, "login_parameters", null)
          allowed_audiences                    = lookup(active_directory_v2.value, "allowed_audiences", null)
        }
      }
      dynamic "azure_static_web_app_v2" {
        for_each = lookup(auth_settings_v2.value, "azure_static_web_app_v2", {}) != {} ? [auth_settings_v2.value.active_directory_v2] : []
        content {
          client_id = azure_static_web_app_v2.value.client_id
        }
      }
      dynamic "custom_oidc_v2" {
        for_each = length(keys(lookup(auth_settings_v2.value, "custom_oidc_v2", {}))) > 0 ? lookup(auth_settings_v2.value, "custom_oidc_v2", {}) : {}
        content {
          name                          = custom_oidc_v2.value.name
          client_id                     = custom_oidc_v2.value.client_id
          openid_configuration_endpoint = custom_oidc_v2.value.openid_configuration_endpoint
          name_claim_type               = lookup(custom_oidc_v2.value, "name_claim_type", null)
          scopes                        = lookup(custom_oidc_v2.value, "scopes", null)
        }
      }
      dynamic "github_v2" {
        for_each = lookup(auth_settings_v2.value, "github_v2", {}) != {} ? [auth_settings_v2.value.github_v2] : []
        content {
          client_id                  = github_v2.value.client_id
          client_secret_setting_name = github_v2.value.client_secret_setting_name
          login_scopes               = lookup(github_v2.value, "login_scopes", null)
        }
      }
      login {
        logout_endpoint                   = lookup(auth_settings_v2.value.login, "logout_endpoint", null)
        token_store_enabled               = lookup(auth_settings_v2.value.login, "token_store_enabled", false)
        token_refresh_extension_time      = lookup(auth_settings_v2.value.login, "token_refresh_extension_time", "72")
        token_store_path                  = lookup(auth_settings_v2.value.login, "token_store_path", null)
        token_store_sas_setting_name      = lookup(auth_settings_v2.value.login, "token_store_sas_setting_name", null)
        preserve_url_fragments_for_logins = lookup(auth_settings_v2.value.login, "preserve_url_fragments_for_logins", false)
        allowed_external_redirect_urls    = lookup(auth_settings_v2.value.login, "allowed_external_redirect_urls", null)
        cookie_expiration_convention      = lookup(auth_settings_v2.value.login, "cookie_expiration_convention", "FixedTime")
        cookie_expiration_time            = lookup(auth_settings_v2.value.login, "cookie_expiration_time", "08:00:00")
        validate_nonce                    = lookup(auth_settings_v2.value.login, "validate_nonce", true)
        nonce_expiration_time             = lookup(auth_settings_v2.value.login, "nonce_expiration_time", "00:05:00")
      }
      # @todo Ignored facebook_v2, google_v2, microsoft_v2, twitter_v2 & apple_v2 blocks inside auth_settings_v2 block
    }
  }
  # auth_settings_v2 block end

  # backup block begin
  dynamic "backup" {
    for_each = try(var.backup, {}) != {} ? [var.backup] : []
    content {
      name = backup.value.name
      dynamic "schedule" {
        for_each = lookup(backup.value, "schedule", {}) != {} ? [backup.value.schedule] : []
        content {
          frequency_interval       = schedule.value.frequency_interval
          frequency_unit           = schedule.value.frequency_unit
          keep_at_least_one_backup = lookup(schedule.value, "keep_at_least_one_backup", false)
          retention_period_days    = lookup(schedule.value, "retention_period_days", "30")
          start_time               = lookup(schedule.value, "start_time", null)
        }
      }
      storage_account_url = backup.value.storage_account_url
      enabled             = lookup(backup.value, "enabled", true)
    }
  }
  # backup block end

  builtin_logging_enabled            = try(var.builtin_logging_enabled, true)
  client_certificate_enabled         = try(var.client_certificate_enabled, null)
  client_certificate_mode            = try(var.client_certificate_mode, "Optional")
  client_certificate_exclusion_paths = try(var.client_certificate_exclusion_paths, null)

  # connection_string block begin
  dynamic "connection_string" {
    for_each = length(keys(try(var.connection_string, {}))) > 0 ? try(var.connection_string, {}) : {}
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }
  # connection_string block end

  daily_memory_time_quota                  = try(var.daily_memory_time_quota, "0")
  enabled                                  = try(var.enabled, true)
  content_share_force_disabled             = try(var.content_share_force_disabled, null)
  functions_extension_version              = try(var.functions_extension_version, "~4")
  ftp_publish_basic_authentication_enabled = try(var.ftp_publish_basic_authentication_enabled, true)
  https_only                               = try(var.https_only, false)
  public_network_access_enabled            = try(var.public_network_access_enabled, true)

  # identity block begin
  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }
  # identity block end

  key_vault_reference_identity_id = try(var.key_vault_reference_identity_id, null)

  # storage_account block begin
  dynamic "storage_account" {
    for_each = length(keys(try(var.storage_account, {}))) > 0 ? try(var.storage_account, {}) : {}
    content {
      access_key   = storage_account.value.access_key
      account_name = storage_account.value.account_name
      name         = storage_account.value.name
      share_name   = storage_account.value.share_name
      type         = storage_account.value.type
      mount_path   = lookup(storage_account.value, "mount_path", null)
    }
  }
  # storage_account block end

  # sticky_settings block begin
  dynamic "sticky_settings" {
    for_each = try(var.sticky_settings, {}) != {} ? [var.sticky_settings] : []
    content {
      app_setting_names       = lookup(sticky_settings.value, "app_setting_names", null)
      connection_string_names = lookup(sticky_settings.value, "connection_string_names", null)
    }
  }
  # sticky_settings block end

  storage_account_access_key                     = try(var.storage_account_access_key, null)
  storage_account_name                           = try(var.storage_account_name, null)
  storage_uses_managed_identity                  = try(var.storage_uses_managed_identity, null)
  storage_key_vault_secret_id                    = try(var.storage_key_vault_secret_id, null)
  virtual_network_subnet_id                      = try(var.virtual_network_subnet_id, null)
  webdeploy_publish_basic_authentication_enabled = try(var.webdeploy_publish_basic_authentication_enabled, true)
  zip_deploy_file                                = try(var.zip_deploy_file, null)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["created_date"],
      tags["hidden-link: /app-insights-instrumentation-key"],
      tags["hidden-link: /app-insights-resource-id"],
      tags["hidden-link: /app-insights-conn-string"],
      tags["hidden-link: acrResourceId"],
      app_settings
    ]
  }
}

#-----------------
# Management Lock
#-----------------
resource "azurerm_management_lock" "management_lock" {
  count      = var.enable_management_lock == true ? 1 : 0
  name       = "mgmt-lock-${azurerm_linux_function_app.linux_function_app.name}"
  scope      = azurerm_linux_function_app.linux_function_app.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion"
}