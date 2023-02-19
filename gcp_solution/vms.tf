resource "google_compute_instance" "web_app_vms" {
  name              = "web-app-vms"
  machine_type      = "e2-standard"
  zone              = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = module.network.public_subnet_link
  }

}
