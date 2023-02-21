resource "google_compute_health_check" "web_app_vm_hc" {
  name        = "web-app-vm-hc"

  timeout_sec         = 10
  check_interval_sec  = 15
  healthy_threshold   = 5
  unhealthy_threshold = 5

  http_health_check {
    port = "80"
  }
}

resource "google_compute_target_pool" "web_app_target_pool" {
  name = "website-target-pool"
  instances = [
    google_compute_instance.web_app_vms["vm1"].self_link,
    google_compute_instance.web_app_vms["vm2"].self_link
  ]
  health_checks = [
	# google_compute_health_check.web_app_vm_hc.name
  ]
}

resource "google_compute_forwarding_rule" "web_app_lb" {
  name       = "web-app-lb"
  target     = google_compute_target_pool.web_app_target_pool.id
  port_range = "80"
}
