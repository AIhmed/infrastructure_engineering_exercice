resource "google_compute_firewall" "allow_http_ssh" {
  name       = "allow-http-shh"
network = google_compute_network.web_app_vpc.name
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
  source_tags = ["web"]
}
