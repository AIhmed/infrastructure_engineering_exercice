resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "terr-alert"
  combiner     = "OR"
  conditions {
    display_name = "test condition"
    condition_threshold {
      threshold_value = 10
      filter     = "metric.type=\"compute.googleapis.com/https/request_count"
      duration   = "60s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  user_labels = {
    foo = "bar"
  }
}
