resource "google_compute_network" "maryland" {
  name                    = "maryland-network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
