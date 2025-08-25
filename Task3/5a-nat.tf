
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "region_a" {
  name         = "america-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-east1"

}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "region_a" {
  name   = "america-nat"
  router = google_compute_router.router_a.name
  region = "us-east1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"


# Add the name for one of your subnetwork.
  subnetwork {
    name                    = google_compute_subnetwork.region_a.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.region_a.self_link]
}


# ##############################################################################################################

# ##############################################################################################################

# #########################################################################################################
