resource "google_compute_instance_template" "africa_tmpl" {
  name_prefix  = "africa-tmpl-"
  machine_type = "e2-micro"
  tags         = ["ssh", "http-server", "vm-test"]

  disk {
    source_image = "projects/debian-cloud/global/images/family/debian-12"
    boot         = true
    auto_delete  = true
    disk_size_gb = 20
  }

  network_interface {
    subnetwork = google_compute_subnetwork.africa.id # subnet-africa in africa-south1
    # No access_config => private-only (use NAT for egress, IAP for SSH)
    access_config {} # ephemeral public IP; remove if you want private-only
  }

#   metadata = {
#     startup-script = <<-EOT
#       #!/bin/bash
#       set -e
#       apt-get update -y
#       apt-get install -y apache2 curl net-tools iputils-ping
#       systemctl enable --now apache2
#       echo "Africa (africa-south1) ready" > /var/www/html/index.html
#     EOT
#   }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

 # Use file() to get shell script for startup script argument
  metadata_startup_script = file("./58-africa-startup.sh")
}
