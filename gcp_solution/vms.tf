locals {
  instances = {
    instance1 = {
      name                    = "web-app-vm1"
      machine_type            = "e2-standard-2"
      zone                    = "us-central1-a"
      metadata_startup_script = file("start_apache2_1.sh")
    },
    instance2 = {
      name                    = "web-app-vm2"
      machine_type            = "e2-standard-2"
      zone                    = "us-central1-a"
      metadata_startup_script = file("start_apache2_2.sh")
    }
  }
}

resource "google_compute_instance" "web_app_vms" {
  for_each     = local.instances
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = module.network.public_subnet_name
    access_config {

    }
  }
  metadata = {
    ssh_keys = file("./id_rsa.pub")
  }
  metadata_startup_script = each.value.metadata_startup_script
  tags                    = ["web"]
}
