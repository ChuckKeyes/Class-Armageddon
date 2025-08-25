# resource "google_compute_firewall" "allow_ssh_icmp_brazil" {
#   name    = "allow-ssh-icmp-brazil"
#   network = google_compute_network.main.name

#   allow { 
#         protocol = "icmp" 
#     }
#   allow { 
#     protocol = "tcp" 
#     ports = ["22"] 
#   }

#   # tighten this to your IP if possible
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["ssh","vm-test"]
# }
resource "google_compute_firewall" "allow_http_brazil" {
  name    = "allow-http-brazil"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  # ideally restrict to your IPs; 0.0.0.0/0 is easiest for a demo
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "allow_ssh_icmp_brazil" {
  name    = "allow-ssh-icmp-brazil"
  network = google_compute_network.main.name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # tighten this to YOUR.PUBLIC.IP/32 for security
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
