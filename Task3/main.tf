# modules/foreign_vpn/main.tf

resource "google_compute_network" "foreign_vpc" {
  name                    = var.foreign_vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

# === Subnetworks ===

resource "google_compute_subnetwork" "subnet_japan" {
  name          = "subnet-japan"
  ip_cidr_range = "10.70.0.0/24"
  region        = "asia-northeast1"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_brazil" {
  name          = "subnet-brazil"
  ip_cidr_range = "10.80.0.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_italy" {
  name          = "subnet-italy"
  ip_cidr_range = "10.90.0.0/24"
  region        = "europe-west8"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_thailand" {
  name          = "subnet-thailand"
  ip_cidr_range = "10.100.0.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.foreign_vpc.id
}

# === HA VPN Gateway ===

resource "google_compute_ha_vpn_gateway" "foreign_ha_gateway" {
  name    = "ha-vpn-foreign"
  region  = "us-east1"
  network = google_compute_network.foreign_vpc.id
}

# === Router ===

resource "google_compute_router" "foreign_router" {
  name    = "foreign-vpn-router"
  region  = "us-east1"
  network = google_compute_network.foreign_vpc.name

  bgp {
    asn = 64513
  }
}

# === VPN Tunnels ===

resource "google_compute_vpn_tunnel" "foreign_tunnel1" {
  name                  = "foreign-vpn-tunnel1"
  region                = "us-east1"
  vpn_gateway           = google_compute_ha_vpn_gateway.foreign_ha_gateway.id
  vpn_gateway_interface = 0
  peer_gcp_gateway      = var.peer_gcp_gateway
  shared_secret         = var.shared_secret
  router                = google_compute_router.foreign_router.id
}

resource "google_compute_vpn_tunnel" "foreign_tunnel2" {
  name                  = "foreign-vpn-tunnel2"
  region                = "us-east1"
  vpn_gateway           = google_compute_ha_vpn_gateway.foreign_ha_gateway.id
  vpn_gateway_interface = 1
  peer_gcp_gateway      = var.peer_gcp_gateway
  shared_secret         = var.shared_secret
  router                = google_compute_router.foreign_router.id
}

# === Interfaces ===

resource "google_compute_router_interface" "foreign_if1" {
  name       = "if1"
  region     = "us-east1"
  router     = google_compute_router.foreign_router.name
  ip_range   = "169.254.11.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.foreign_tunnel1.name
}

resource "google_compute_router_interface" "foreign_if2" {
  name       = "if2"
  region     = "us-east1"
  router     = google_compute_router.foreign_router.name
  ip_range   = "169.254.12.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.foreign_tunnel2.name
}

# === BGP Peers ===

resource "google_compute_router_peer" "foreign_peer1" {
  name            = "peer1"
  router          = google_compute_router.foreign_router.name
  region          = "us-east1"
  peer_ip_address = "169.254.11.2"
  peer_asn        = var.peer_asn
  interface       = google_compute_router_interface.foreign_if1.name
}

resource "google_compute_router_peer" "foreign_peer2" {
  name            = "peer2"
  router          = google_compute_router.foreign_router.name
  region          = "us-east1"
  peer_ip_address = "169.254.12.2"
  peer_asn        = var.peer_asn
  interface       = google_compute_router_interface.foreign_if2.name
}

# === NCC Spoke ===

resource "google_network_connectivity_spoke" "foreign_spoke" {
  provider    = google-beta
  name        = "foreign-vpn-spoke"
  location    = "global"
  project     = var.project_id
  hub         = var.ncc_hub_id
  description = "Spoke connecting foreign testers to HQ"

  linked_vpn_tunnels {
    uris = [
      google_compute_vpn_tunnel.foreign_tunnel1.id,
      google_compute_vpn_tunnel.foreign_tunnel2.id
    ]
    site_to_site_data_transfer = true
  }
}
