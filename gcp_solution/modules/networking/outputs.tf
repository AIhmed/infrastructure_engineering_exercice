output "public_subnet_link" {
value = google_compute_subnetwork.public_subnet.self_link
}
output "vpc_name" {
value = google_compute_network.web_app_vpc.name
}
