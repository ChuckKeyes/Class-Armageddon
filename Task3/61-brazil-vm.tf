resource "google_compute_instance" "vm_brazil" {
  name         = "vm-brazil"
  zone         = "southamerica-west1-b" # pick any zone in the region
  machine_type = "e2-micro"
  tags         = ["vm-test", "ssh"]

  network_interface {
    subnetwork = google_compute_subnetwork.brazil.id
     access_config {}                       # ephemeral public IP for quick SSH
  }

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 20
    }
    auto_delete = true
  }

   # Use file() to get shell script for startup script argument
  metadata_startup_script = file("./65-brazil-startup.sh")
}
