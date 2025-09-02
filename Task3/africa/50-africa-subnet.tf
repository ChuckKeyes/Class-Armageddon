# africa-subnet.tf
resource "google_compute_subnetwork" "africa" {
  name                     = "subnet-africa"
  ip_cidr_range            = "10.10.50.0/24"
  region                   = "africa-south1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true
}
