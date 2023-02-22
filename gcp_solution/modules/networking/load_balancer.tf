resource "google_compute_http_health_check" "web_app_vm_hc" {
  name               = "web-app-vm-hc"
  timeout_sec        = 5
  check_interval_sec = 10
  request_path       = "/"
  #healthy_threshold   = 5
  #unhealthy_threshold = 5
}

resource "google_compute_target_pool" "web_app_target_pool" {
  name   = "website-target-pool"
  region = "us-central1"
  instances = [
    var.vm1_url,
    var.vm2_url
  ]
  health_checks = [
    google_compute_http_health_check.web_app_vm_hc.name
  ]
  session_affinity = "CLIENT_IP"
}

resource "google_compute_forwarding_rule" "web_app_lb" {
  name       = "web-app-lb"
  target     = google_compute_target_pool.web_app_target_pool.id
  port_range = "80"
}
