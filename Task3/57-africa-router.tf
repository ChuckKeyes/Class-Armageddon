resource "google_compute_router" "main_afs1" {
  name    = "main-afs1-router"
  region  = "africa-south1"
  network = google_compute_network.main.id
  bgp { asn = 64513 }
}

resource "google_compute_router_nat" "main_afs1_nat" {
  name                               = "main-afs1-nat"
  router                             = google_compute_router.main_afs1.name
  region                             = google_compute_router.main_afs1.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.africa.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
