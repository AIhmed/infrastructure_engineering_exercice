# create a default route using the default internet gateway created automatically by google cloud
resource "google_compute_route" "public_routing" {
  name    = "public-routing"
  network = google_compute_network.web_app_vpc.name
  tags = ["public-subnet"]

  dest_range       = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
}
/*
resource "google_compute_route" "rout_to_lb" {
name = "route-to-lb"
network = google_compute_network.web_app_vpc.name

dest_range = "10.0.0.0/24"
next_hop_gateway = google_compute_forwarding_rule.web_app_lb.name
}*/
