
data "azurerm_key_vault" "dcp_keyvault" {
  name                = var.dcp_keyvault
  resource_group_name = var.dcp_keyvault_resourcegroup
}


data "azurerm_key_vault_secret" "dcp_version" {
  name         = var.dcp_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_host_version" {
  name         = var.dcp_mfe_host_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_client_vehicle_maintenance_version" {
  name         = var.dcp_mfe_client_vehicle_maintenance_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_client_notifications_version" {
  name         = var.dcp_mfe_client_notifications_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_client_navbar_version" {
  name         = var.dcp_mfe_client_navbar_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_legacy_version" {
  name         = var.dcp_mfe_legacy_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_static_version" {
  name         = var.dcp_mfe_static_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_client_geofence_version" {
  name         = var.dcp_mfe_client_geofence_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_client_service_center_version" {
  name         = var.dcp_mfe_client_service_center_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

data "azurerm_key_vault_secret" "dcp_mfe_vhealth_index_version" {
  name         = var.dcp_mfe_vhealth_index_version_key
  key_vault_id = data.azurerm_key_vault.dcp_keyvault.id
}

resource "azurerm_resource_group" "dcp_linux_app_service_resource_group" {
  name     = var.dcp_linux_app_service_rg_name
  location = var.location
}

resource "azurerm_app_service_plan" "dcp_linux_app_service_plan" {
  name                = var.dcp_linux_app_service_plan_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  kind                = var.dcp_linux_app_service_plan_kind
  reserved            = true

  sku {
    tier = var.dcp_app_service_plan_sku_tier
    size = var.dcp_app_service_plan_sku_size
  }
}

resource "azurerm_management_lock" "dcp_linux_app_service_plan_management_lock" {
  name       = "dcp_linux_app_service_plan_management_lock"
  scope      = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion - static ip preservation"
}

resource "azurerm_app_service" "dcp_web_app" {
  name                = var.dcp_portal_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true
  ftp_state           = "Disabled"

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|${var.webapp_custom_image_name}:${data.azurerm_key_vault_secret.dcp_version.value}"
    ftps_state       = var.ftps_state
    http2_enabled    = var.http2_enabled
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }

  # TODO: re-enable after updating all environments
  # lifecycle {
  #   ignore_changes = [
  #     app_settings,
  #     site_config,
  #   ]
  # }
}

## DCP Deployment slot for eservices
resource "azurerm_app_service_slot" "dcp_web_app_eservices_slot" {
  name                = var.dcp_portal_app_service_slot_eservices_name
  location            = azurerm_app_service.dcp_web_app.location
  app_service_name    = azurerm_app_service.dcp_web_app.name
  resource_group_name = azurerm_app_service.dcp_web_app.resource_group_name
  app_service_plan_id = azurerm_app_service.dcp_web_app.app_service_plan_id
}

## DCP "staging" deployment slot
resource "azurerm_app_service_slot" "dcp_web_app_staging_slot" {
  name                = var.dcp_portal_app_service_slot_staging_name
  location            = azurerm_app_service.dcp_web_app.location
  app_service_name    = azurerm_app_service.dcp_web_app.name
  resource_group_name = azurerm_app_service.dcp_web_app.resource_group_name
  app_service_plan_id = azurerm_app_service.dcp_web_app.app_service_plan_id
}

resource "azurerm_app_service" "dcp_mfe_host_web_app" {
  name                = var.dcp_portal_mfe_host_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_host_custom_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_host_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_root_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_host_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_host_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_client_vehicle_maintenance_web_app" {
  name                = var.dcp_portal_mfe_client_vehicle_maintenance_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_client_vehicle_maintenance_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_client_vehicle_maintenance_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_client_vehicle_maintenance_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_client_vehicle_maintenance_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_client_notifications_web_app" {
  name                = var.dcp_portal_mfe_client_notifications_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_client_notifications_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_client_notifications_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_client_notifications_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_client_notifications_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_client_navbar_web_app" {
  name                = var.dcp_portal_mfe_client_navbar_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_client_navbar_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_client_navbar_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_client_navbar_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_client_navbar_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_legacy_web_app" {
  name                = var.dcp_portal_mfe_legacy_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_legacy_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_legacy_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_legacy_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_legacy_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_static_web_app" {
  name                = var.dcp_portal_mfe_static_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_static_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_static_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_root_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_static_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_static_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_client_geofence_web_app" {
  name                = var.dcp_portal_mfe_client_geofence_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_client_geofence_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_client_geofence_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_client_geofence_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_client_geofence_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_client_service_center_web_app" {
  name                = var.dcp_portal_mfe_client_service_center_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_client_service_center_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_client_service_center_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_client_service_center_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_client_service_center_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_app_service" "dcp_mfe_vhealth_index_web_app" {
  name                = var.dcp_portal_mfe_vhealth_index_app_service_name
  location            = azurerm_resource_group.dcp_linux_app_service_resource_group.location
  resource_group_name = azurerm_resource_group.dcp_linux_app_service_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.dcp_linux_app_service_plan.id
  https_only          = true

  site_config {
    app_command_line  = "serve  ./build"
    linux_fx_version  = "DOCKER|${var.webapp_mfe_vhealth_index_image_name}:${data.azurerm_key_vault_secret.dcp_mfe_vhealth_index_version.value}"
    ftps_state        = var.ftps_state
    http2_enabled     = var.http2_enabled
    health_check_path = var.mfe_health_check_remoteentry_path
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"        = "false"
    "DOCKER_REGISTRY_SERVER_URL"                 = "" # DO NOT REMOVE, MUST REMAIN EMPTY!
    "DOCKER_REGISTRY_SERVER_USERNAME"            = var.shared_acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"            = var.shared_acr_admin_password
    "APPINSIGHTS_INSTRUMENTATIONKEY"             = azurerm_application_insights.dcp_mfe_vhealth_index_web_app.instrumentation_key
    "APPINSIGHTS_PROFILEFEATURE_VERSION"         = var.dcp_api_app_insights_profile_feature_version
    "APPINSIGHTS_SNAPSHOTFEATURE_VERSION"        = var.dcp_api_app_insights_snapshot_feature_version
    "APPLICATIONINSIGHTS_CONNECTION_STRING"      = azurerm_application_insights.dcp_mfe_vhealth_index_web_app.connection_string
    "ApplicationInsightsAgent_EXTENSION_VERSION" = var.dcp_api_app_insights_agent_extension_version_linux
    "DiagnosticServices_EXTENSION_VERSION"       = var.dcp_api_app_insights_diagnostic_services_extension_version
  }
}

resource "azurerm_management_lock" "dcp_web_app_management_lock" {
  name       = "dcp_web_app_management_lock"
  scope      = azurerm_app_service.dcp_web_app.id
  lock_level = "CanNotDelete"
  notes      = "Locked to prevent deletion - static ip preservation"
}

resource "azurerm_role_assignment" "app_admins" {
  role_definition_name = "Website Contributor"
  principal_id         = var.webapp_admin_security_group_id
  scope                = azurerm_app_service.dcp_web_app.id
}

