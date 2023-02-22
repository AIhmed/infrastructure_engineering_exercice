locals {
  vms = {
    vm1 = {
      name                    = "terr-vm1"
      machine_type            = "e2-standard-2"
      zone                    = "us-central1-a"
      metadata_startup_script = file("scripts/start_apache2_1.sh")
    },
    vm2 = {
      name                    = "terr-vm2"
      machine_type            = "e2-standard-2"
      zone                    = "us-central1-a"
      metadata_startup_script = file("scripts/start_apache2_2.sh")
    }
  }
}

resource "google_compute_instance" "terr_vms" {
  for_each     = local.vms
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = module.network.terr_private_subnet_name
    #access_config {

    #}
  }
  metadata = {
    ssh_keys = "hmed:${file("./credentials/id_rsa.pub")}"
  }
  metadata_startup_script = each.value.metadata_startup_script
  tags                    = ["terr-allow-http"]
}
