resource "google_compute_subnetwork" "brazil" {
  name                     = "subnet-brazil"
  ip_cidr_range            = "10.10.60.0/24"
  region                   = "southamerica-west1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
