variable "apim_admin_security_group_id" {}

variable "dcp_api_app_insights_agent_extension_version" {}

variable "dcp_api_app_insights_agent_extension_version_linux" {}

variable "dcp_api_app_insights_diagnostic_services_extension_version" {}

variable "dcp_api_app_insights_instrumentation_engine_extension_version" {}

variable "dcp_api_app_insights_profile_feature_version" {}

variable "dcp_api_app_insights_snapshot_debugger_extension_version" {}

variable "dcp_api_app_insights_snapshot_feature_version" {}

variable "dcp_api_app_insights_xdt_base_extensions" {}

variable "dcp_api_app_insights_xdt_mode" {}

variable "dcp_api_app_insights_xdt_preempt_sdk" {}

variable "dcp_api_app_service_name" {}

variable "dcp_app_dotnet_framework_version" {}

variable "dcp_app_service_plan_sku_size" {}

variable "dcp_app_service_plan_sku_tier" {}

variable "dcp_keyvault" {}

variable "dcp_keyvault_resourcegroup" {}

variable "dcp_portal_app_service_name" {}

variable "dcp_portal_app_service_slot_eservices_name" {}

variable "dcp_portal_app_service_slot_staging_name" {}

variable "dcp_portal_mfe_host_app_service_name" {}

variable "dcp_portal_mfe_client_vehicle_maintenance_app_service_name" {}

variable "dcp_portal_mfe_client_notifications_app_service_name" {}

variable "dcp_portal_mfe_client_navbar_app_service_name" {}

variable "dcp_portal_mfe_legacy_app_service_name" {}

variable "dcp_portal_mfe_static_app_service_name" {}

variable "dcp_portal_mfe_client_geofence_app_service_name" {}


variable "dcp_linux_app_service_plan_kind" {}

variable "dcp_linux_app_service_plan_name" {}

variable "dcp_linux_app_service_rg_name" {}

variable "dcp_version_key" {}

variable "dcp_mfe_host_version_key" {}

variable "dcp_mfe_client_vehicle_maintenance_version_key" {}

variable "dcp_mfe_client_notifications_version_key" {}

variable "dcp_mfe_client_navbar_version_key" {}

variable "dcp_mfe_legacy_version_key" {}

variable "dcp_mfe_static_version_key" {}

variable "dcp_mfe_client_geofence_version_key" {}

#-----------------------------------------
# app-dcp-mfe-vhealth-service-center
#-----------------------------------------
variable "dcp_portal_mfe_client_service_center_app_service_name" {}

variable "dcp_mfe_client_service_center_version_key" {}

variable "webapp_mfe_client_service_center_image_name" {}
#-----------------------------------------
# app-dcp-mfe-vhealth-index
#-----------------------------------------
variable "dcp_portal_mfe_vhealth_index_app_service_name" {}

variable "dcp_mfe_vhealth_index_version_key" {}

variable "webapp_mfe_vhealth_index_image_name" {}


variable "dcp_web_api_application_insights_type" {}

variable "dcp_windows_app_service_plan_name" {}

variable "dcp_windows_app_service_rg_name" {}

variable "location" {}

variable "naming_suffix" {}

variable "portal_certs_id" {}

variable "shared_acr_admin_password" {
  sensitive = true
}

variable "shared_acr_admin_username" {
  sensitive = true
}

variable "shared_acr_url" {}

variable "snet_dcportal_id" {}

variable "subscription_id" {}

variable "webapp_admin_pwd" {
  sensitive = true
}

variable "webapp_admin_security_group_id" {}

variable "webapp_admin_sp" {
  sensitive = true
}

variable "webapp_custom_image_name" {}

variable "webapp_mfe_host_custom_image_name" {}

variable "webapp_mfe_client_vehicle_maintenance_image_name" {}

variable "webapp_mfe_client_notifications_image_name" {}

variable "webapp_mfe_client_navbar_image_name" {}

variable "webapp_mfe_legacy_image_name" {}

variable "webapp_mfe_static_image_name" {}

variable "webapp_mfe_client_geofence_image_name" {}

variable "tags" {}

variable "mfe_health_check_root_path" {}

variable "mfe_health_check_remoteentry_path" {}

variable "ftps_state" {}

variable "http2_enabled" {}