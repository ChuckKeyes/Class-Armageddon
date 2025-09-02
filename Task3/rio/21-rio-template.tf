# Instance Template used by the MIG
resource "google_compute_instance_template" "rio_tmpl" {
  name_prefix  = "rio-tmpl-"
  machine_type = "e2-micro"
  tags         = ["ssh", "http-server", "vm-test"]

  disk {
    source_image = "projects/debian-cloud/global/images/family/debian-12"
    auto_delete  = true
    boot         = true
    disk_size_gb = 20
  }

  network_interface {
    subnetwork = google_compute_subnetwork.rio.id # your Rio subnet in southamerica-east1
    access_config {}                              # ephemeral external IP per VM
  }

  # metadata = {
  # Provide your startup script that installs Apache and writes index.html
  # startup-script = file("${path.module}/startup.sh")

  # OPTIONAL: embed rio.jpeg if it exists; comment out if not
  # rio_b64 = filebase64("${path.module}/rio.jpeg")
  # }

  # Recommended for public web testing (harden later)
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
  }

  # Helpful if you attach a load balancer later
  can_ip_forward = false

# Use file() to get shell script for startup script argument
  metadata_startup_script = file("./27-rio-startup.sh")

}
