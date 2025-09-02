resource "google_compute_subnetwork" "maryland" {
  name          = "maryland"
  ip_cidr_range = "10.20.10.0/24"
  region        = "us-east1"
  network       = google_compute_network.maryland.id
  private_ip_google_access = true
}
