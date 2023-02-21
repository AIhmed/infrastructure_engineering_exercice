resource "google_compute_network" "web_app_vpc" {
  name                    = "web-app-vpc"
  auto_create_subnetworks = false
}
