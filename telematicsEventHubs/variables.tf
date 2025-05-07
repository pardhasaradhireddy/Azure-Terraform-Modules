variable "location" {}

variable "resource_group_name" {}

variable "environment" {}

variable "eventhub_ns_1_name" {}

variable "eventhub_1a_name" {
  default = "pdtmwuehovt01"
}

variable "eventhub_ns_2_name" {}

variable "eventhub_2a_name" {
  default = "ctpaggrdatafeed"
}

variable "eventhub_2b_name" {
  default = "dtna.customers.testpve.aggregates"
}

variable "eventhub_2c_name" {
  default = "dtna.customers.tm05656.aggregates"
}

variable "eventhub_2d_name" {
  default = "dtna.customers.tm37911.aggregates"
}

variable "eventhub_2e_name" {
  default = "dtna.customers.tm.78210.aggregates"
}

variable "eventhub_2f_name" {
  default = "dtna.customers.tn23191.aggregates"
}

variable "eventhub_2g_name" {
  default = "dtna.customers.tv24504.aggregates"
}

variable "eventhub_2h_name" {
  default = "dtna.internal.detriot.ctp.logs"
}

variable "eventhub_2i_name" {
  default = "dtna.internal.detriot.tracktrucks"
}

variable "consumer_group_2c_name" {
  default = "werner"
}

variable "consumer_group_2e_name" {
  default = "tm78210.consumer"
}

variable "consumer_group_2g_name" {
  default = "tv24504.consumer"
}

variable "eventhub_ns_3_name" {}

variable "eventhub_3a_name" {
  default = "dtna.internal.detroit.anonymized.faults"
}

variable "eventhub_3b_name" {
  default = "dtna.internal.detroit.faults"
}

variable "eventhub_3c_name" {
  default = "dtna.internal.detroit.gps"
}

variable "eventhub_3d_name" {
  default = "dtna.internal.detroit.tracktrucks"
}

variable "eventhub_3e_name" {
  default = "dtna.internal.engineering.gps"
}

variable "eventhub_3f_name" {
  default = "dtna.internal.engineering.vehiclediagnostics"
}

variable "eventhub_3g_name" {
  default = "dtna.internal.pairing.ctp"
}

variable "eventhub_3h_name" {
  default = "dtna.internal.pairing.zonar"
}

variable "eventhub_3i_name" {
  default = "dtna.internal.vehicle.diagnostics"
}

variable "consumer_group_3a_name" {
  default = "fuso"
}

variable "consumer_group_3b1_name" {
  default = "bigdataanalytics"
}

variable "consumer_group_3b2_name" {
  default = "engineering_data_solutions_eve"
}

variable "consumer_group_3b3_name" {
  default = "fidat"
}

variable "consumer_group_3c_name" {
  default = "bigdataanalytics"
}

variable "consumer_group_3i1_name" {
  default = "bigdataanalytics"
}

variable "consumer_group_3i2_name" {
  default = "kustoanalytics"
}

variable "eventhub_ns_4_name" {}

variable "eventhub_4a_name" {
  default = "dtna.ctp.to.zonar"
}

variable "eventhub_4b_name" {
  default = "monitor-data-in"
}

variable "eventhub_4c_name" {
  default = "zonar.to.dtna.ctp"
}

variable "consumer_group_4a_name" {
  default = "diagnostics-only"
}

variable "consumer_group_4b_name" {
  default = "dtnareporting"
}

variable "consumer_group_4c1_name" {
  default = "diagnostics-only"
}

variable "consumer_group_4c2_name" {
  default = "zonartoctp"
}

variable "eventhub_ns_5_name" {}

variable "eventhub_5a_name" {
  default = "dtna.customers.tm86774.aggregates"
}

variable "eventhub_5b_name" {
  default = "dtna.customers.tn00611.aggregates"
}

variable "eventhub_5c_name" {
  default = "dtna.customers.tp28790.aggregates"
}

variable "eventhub_ns_6_name" {}

variable "eventhub_6a_name" {
  default = "notifications-prod.data"
}

variable "eventhub_ns_7_name" {}

variable "eventhub_7a_name" {
  default = "pdtmwutelehbo01"
}

variable "consumer_group_7a1_name" {
  default = "davids-monitor"
}

variable "consumer_group_7a2_name" {
  default = "devvt"
}

variable "consumer_group_7a3_name" {
  default = "prodvt"
}

variable "consumer_group_7a4_name" {
  default = "qavt"
}

variable "telematics_eventhubs_ns_1_diagnostics_name" {
  default = "telematicsEventhubsNs1Diagnostics"
}

variable "telematics_eventhubs_ns_2_diagnostics_name" {
  default = "telematicsEventhubsNs2Diagnostics"
}

variable "telematics_eventhubs_ns_3_diagnostics_name" {
  default = "telematicsEventhubsNs3Diagnostics"
}

variable "telematics_eventhubs_ns_4_diagnostics_name" {
  default = "telematicsEventhubsNs4Diagnostics"
}

variable "telematics_eventhubs_ns_5_diagnostics_name" {
  default = "telematicsEventhubsNs5Diagnostics"
}

variable "telematics_eventhubs_ns_6_diagnostics_name" {
  default = "telematicsEventhubsNs6Diagnostics"
}

variable "telematics_eventhubs_ns_7_diagnostics_name" {
  default = "telematicsEventhubsNs7Diagnostics"
}

variable "activity_log_eventhub_name" {}

variable "log_analytics_eventhub_ns_send_rule_primary_id" {}

variable "tags" {}