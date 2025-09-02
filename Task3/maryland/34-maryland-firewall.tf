############################################################
# Allow Google Front Ends (GFE) / Health Checks to port 80
# Required for external HTTP(S) LB backends
############################################################
resource "google_compute_firewall" "maryland_gfe_allow_80" {
  name      = "maryland-gfe-allow-80"
  network   = google_compute_network.main.id
  direction = "INGRESS"
  target_tags = ["lb-backend", "maryland"]

  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22"
  ]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
