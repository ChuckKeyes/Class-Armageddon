resource "google_compute_router" "md_use1" {
  name    = "maryland-use1-router"
  region  = "us-east1"
  network = google_compute_network.maryland.id
  bgp { asn = 64521 }
}

resource "google_compute_router_nat" "md_use1_nat" {
  name                               = "maryland-use1-nat"
  router                             = google_compute_router.md_use1.name
  region                             = google_compute_router.md_use1.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.maryland.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
