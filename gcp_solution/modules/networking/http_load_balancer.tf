resource "google_compute_region_backend_service" "terr_backend_service" {
  region        = "us-central1"
  name          = "terr-backend-service"
  health_checks = [google_compute_http_health_check.terr_http_hc.id]
  backend {
    group = var.terr_vms_group_id
  }
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_forwarding_rule" "terr_http_lb" {
  name            = "terr_http_lb"
  backend_service = google_compute_region_backend_service.terr_backend_service.id
  ip_protocol     = "L3_DEFAULT"
  port_range      = "80"
}

