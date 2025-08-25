resource "google_compute_router" "main_saw1" {
  name    = "main-saw1-router"
  region  = "southamerica-west1"
  network = google_compute_network.main.id
  bgp { asn = 64512 }
}

resource "google_compute_router_nat" "main_saw1_nat" {
  name                               = "main-saw1-nat"
  router                             = google_compute_router.main_saw1.name
  region                             = google_compute_router.main_saw1.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.brazil.id # your Santiago subnet resource
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
