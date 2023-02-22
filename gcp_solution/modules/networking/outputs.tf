output "public_subnet_name" {
  value = google_compute_subnetwork.private_subnet.name
}
output "vpc_name" {
  value = google_compute_network.web_app_vpc.name
}
