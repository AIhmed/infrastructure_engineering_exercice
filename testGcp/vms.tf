resource "google_compute_instance" "web_app_vms" {
  name         = "web-app-vms"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = google_compute_network.web_app_vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {

    }
  }
  metadata = {
    ssh_keys = file("./id_rsa.pub")
  }
  metadata_startup_script = file("start_apache2.sh")
  tags                    = ["web"]
}
