output "public_subnet_name" {
  value = module.network.public_subnet_name
}
output "vm_names" {
  value = google_compute_instance.web_app_vms["vm1"].name
}
