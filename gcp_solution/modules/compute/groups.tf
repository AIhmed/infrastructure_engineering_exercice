resource "google_compute_instance_group" "terr_vms_group" {
  name    = "terr-vms-group"
  network = var.terr_vpc_name
  zone    = "us-central1"
  instances = [
    google_compute_instance.terr_vms["vm1"].name,
    google_compute_instance.terr_vms["vm2"].name
  ]

}
