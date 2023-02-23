resource "google_compute_http_health_check" "terr_http_hc" {
  name               = "terr-http-hc"
  timeout_sec        = 10
  check_interval_sec = 15
  request_path       = "/"
  #healthy_threshold   = 5
  #unhealthy_threshold = 5
}
