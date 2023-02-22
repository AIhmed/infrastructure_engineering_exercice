output "terr_private_subnet_name" {
  value = google_compute_subnetwork.terr_private_subnet.name
}
output "lb_ip" {
value = google_compute_forwarding_rule.terr_lb.ip_address
}
