# ---------- Simple firewall for testing ----------
# Allow ICMP from anywhere (ping)
resource "google_compute_firewall" "allow_icmp" {
  name    = "${var.prefix}-allow-icmp"
  network = google_compute_network.foreign_vpc.name
  allow { protocol = "icmp" }
  source_ranges = ["0.0.0.0/0"]
}

# Allow SSH from Google IAP (recommended) — or change to your IP/CIDR
resource "google_compute_firewall" "allow_ssh_iap" {
  name    = "${var.prefix}-allow-ssh-iap"
  network = google_compute_network.foreign_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["ssh-iap"]
}

# ---------- One VM per subnet (Debian 12) ----------
locals {
  test_instances = {
    japan = {
      zone       = "asia-northeast1-b"
      subnetwork = google_compute_subnetwork.subnet_japan.self_link
      name       = "${var.prefix}-vm-japan"
      tags       = ["ssh-iap"]
    }
    brazil = {
      zone       = "southamerica-east1-b"
      subnetwork = google_compute_subnetwork.subnet_brazil.self_link
      name       = "${var.prefix}-vm-brazil"
      tags       = ["ssh-iap"]
    }
    italy = {
      zone       = "europe-west8-b"
      subnetwork = google_compute_subnetwork.subnet_italy.self_link
      name       = "${var.prefix}-vm-italy"
      tags       = ["ssh-iap"]
    }
    thailand = {
      zone       = "asia-southeast1-b"
      subnetwork = google_compute_subnetwork.subnet_thailand.self_link
      name       = "${var.prefix}-vm-thailand"
      tags       = ["ssh-iap"]
    }
  }
}

resource "google_compute_instance" "test" {
  for_each                   = local.test_instances
  name                       = each.value.name
  zone                       = each.value.zone
  machine_type               = var.vm_machine_type
  allow_stopping_for_update  = true
  tags                       = each.value.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = var.vm_disk_gb
      type  = "pd-balanced"
    }
    auto_delete = true
  }

  network_interface {
    subnetwork = each.value.subnetwork

    # Optional ephemeral public IP for package installs/SSH (set var.vm_public_ip = true)
    dynamic "access_config" {
      for_each = var.vm_public_ip ? [1] : []
      content {}
    }
  }

  # Minimal service account (read-only is fine for test VMs)
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y || true
    apt-get install -y traceroute mtr-tiny dnsutils net-tools tcpdump || true
    echo "Test VM $(hostname) ready" > /etc/motd
  EOT
}
