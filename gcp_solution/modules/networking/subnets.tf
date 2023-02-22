resource "google_compute_subnetwork" "private_subnet" {
  name                     = "private-subnet"
  network                  = google_compute_network.web_app_vpc.name
  ip_cidr_range            = "10.0.1.0/24"
  private_ip_google_access = false
}
