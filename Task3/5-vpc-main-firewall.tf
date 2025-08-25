resource "google_compute_firewall" "allow_iap_ssh" {
  name          = "allow-iap-ssh"
  network       = google_compute_network.main.name
  direction     = "INGRESS"
  target_tags   = ["ssh"]
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
resource "google_compute_firewall" "allow_http" {
  name        = "allow-http"
  network     = google_compute_network.main.name
  direction   = "INGRESS"
  target_tags = ["http-server"]
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  # For LB health checks:
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}
