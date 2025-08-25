# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# # Resource: Reserve Regional Static IP Address
# resource "google_compute_address" "loadbalancer" {
#   name   = "loadbalancer-static-ip"
#   region = "us-east1"
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule
# # Resource: Regional Forwarding Rule
# resource "google_compute_forwarding_rule" "loadbalancer" {
#   name                  = "loadbalancer-forwarding-rule"
#   target                = google_compute_region_target_http_proxy.loadbalancer.self_link
#   port_range            = "80"
#   ip_protocol           = "TCP"
#   ip_address            = google_compute_address.loadbalancer.address
#   load_balancing_scheme = "EXTERNAL_MANAGED" # Current Gen LB (not classic)
#   network               = google_compute_network.ck-main.id

#   # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
#   depends_on = [google_compute_subnetwork.regional_proxy_subnet]
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_url_map
# # Resource: Regional URL Map
# resource "google_compute_url_map" "loadbalancer" {
#   name            = "loadbalancer-url-map"
#   default_service = google_compute__backend_service.loadbalancer.self_link
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_http_proxy
# # Resource: Regional HTTP Proxy
# resource "google_compute_target_http_proxy" "loadbalancer" {
#   name    = "loadbalancer-http-proxy"
#   url_map = google_compute_url_map.loadbalancer.self_link
# }

