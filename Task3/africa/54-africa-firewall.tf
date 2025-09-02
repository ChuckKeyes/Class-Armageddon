# africa-firewall.tf
resource "google_compute_firewall" "allow_ssh_icmp_africa" {
  name    = "allow-ssh-icmp-africa"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  # tighten to your IP if possible
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh", "vm-test"]
}
