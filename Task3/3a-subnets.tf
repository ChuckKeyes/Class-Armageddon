resource "google_compute_subnetwork" "region_a" {
  name                     = "america"
  ip_cidr_range            = "10.10.7.0/24"
  region                   = "us-east1"
  network                  = google_compute_network.ck-main.id
  private_ip_google_access = true
}


####  This is a different network....

