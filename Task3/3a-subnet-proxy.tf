# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# resource "google_compute_subnetwork" "hqinternal" {
#   name                     = "hqinternal"
#   ip_cidr_range            = "10.100.10.0/24"
#   region                   = "us-central1"
#   network                  = google_compute_network.main.id
#   private_ip_google_access = true
# }

# Regional Proxy-Only Subnet 
# # Required for Regional Application Load Balancer for traffic offloading
# resource "google_compute_subnetwork" "regional_proxy_subnet" {
#   name          = "regional-proxy-subnet"
#   region        = "us-east1"
#   ip_cidr_range = "10.0.0.0/24"
#   # This purpose reserves this subnet for regional Envoy-based load balancers
#   purpose       = "REGIONAL_MANAGED_PROXY"
#   network       = google_compute_network.ck-main.id
#   role          = "ACTIVE"
# }
