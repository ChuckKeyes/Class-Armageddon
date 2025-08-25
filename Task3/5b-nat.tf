
# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# resource "google_compute_address" "region_b" {
#   name         = "africa-nat"
#   address_type = "EXTERNAL"
#   network_tier = "PREMIUM"
#   region = "africa-south1"
# }


# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
# resource "google_compute_router_nat" "region_b" {
#   name   = "africa-nat"
#   router = google_compute_router.africa-router.name
#   region = "africa-south1"

#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
#   nat_ip_allocate_option             = "MANUAL_ONLY"


# # Add the name for one of your subnetwork.
#   subnetwork {
#     name                    = google_compute_subnetwork.region_b.id
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }

#   nat_ips = [google_compute_address.region_b.self_link]
# }
