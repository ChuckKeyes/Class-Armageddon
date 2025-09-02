resource "google_compute_router" "main_sae1" {
  name    = "main-sae1-router"
  region  = "southamerica-east1"
  network = google_compute_network.main.id
  bgp { asn = 64525 }
}

resource "google_compute_router_nat" "main_sae1_nat" {
  name                               = "main-sae1-nat"
  router                             = google_compute_router.main_sae1.name
  region                             = google_compute_router.main_sae1.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  # include any subnets in southamerica-east1 that need egress without public IPs
  subnetwork {
    name                    = google_compute_subnetwork.rio.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
