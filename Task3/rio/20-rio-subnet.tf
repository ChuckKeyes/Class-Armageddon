# rio-subnet.tf
resource "google_compute_subnetwork" "rio" {
  name          = "rio"
  ip_cidr_range = "10.0.10.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.main.id
}



#   network_interface {
#     network    = "main"
#     subnetwork = "rio"
#     access_config {}
#   }

#   boot_disk {
#     initialize_params {
#      # image = "debian-cloud/debian-12"
#       image = "windows-server-2022-dc-core-v20250514"
#       size  = 40
#     }
#       auto_delete = true
#    }

#   # labels = {
#   #   env = "rio-vm"
#   # }

#   # scheduling {
#   #   preemptible        = true
#   #   automatic_restart  = false
#   # }

#   # metadata_startup_script = file("./startup2.sh")
# }
