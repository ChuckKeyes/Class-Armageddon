# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# # https://developer.hashicorp.com/terraform/language/functions/file
# # # Google Compute Engine: Regional Instance Template
# resource "google_compute_region_instance_template" "ck-africa" {
#   name         = "africa-template-terraform"
#   description  = "This template is used to clone lizzo"
#   machine_type = "e2-medium"
#   region        = "africa-south1"

#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.johannesburg.id
#     /*access_config {
#       # Include this section to give the VM an external IP address
#     } */
#   }

#   # Install Webserver using file() function
#   # metadata_startup_script = file("./startup.sh")
# }

# ###################################################################################################

# resource "google_compute_region_instance_template" "ck-maryland" {
#   name         = "maryland-template-terraform"
#   description  = "This template is used to clone lizzo"
#   machine_type = "e2-medium"
#   region        = "us-east1"

#   # Create a new disk from an image and set as boot disk
#   disk {
#     source_image = "debian-cloud/debian-12"
#     boot         = true
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.cek-maryland.id
#     /*access_config {
#       # Include this section to give the VM an external IP address
#     } */
#   }

#   # Install Webserver using file() function
#   # metadata_startup_script = file("./startup.sh")
# }

# ###########################################################################################################

# # resource "google_compute_region_instance_template" "ck-rio" {
# #   name         = "rio-template-terraform"
# #   description  = "This template is used to clone lizzo"
# #   machine_type = "e2-medium"
# #   region        = "southamerica-east1"

# #   # Create a new disk from an image and set as boot disk
# #   disk {
# #     source_image = "debian-cloud/debian-12"
# #     boot         = true
# #   }

# #   # Network Configurations 
# #   network_interface {
# #     subnetwork = google_compute_subnetwork.rio.id
# #     /*access_config {
# #       # Include this section to give the VM an external IP address
# #     } */
# #   }

# #   # Install Webserver using file() function
# #   metadata_startup_script = file("./startup.sh")
# # }

# # #####################################################################################################

# # resource "google_compute_region_instance_template" "ck-santiago" {
# #   name         = "santiago-template-terraform"
# #   description  = "This template is used to clone lizzo"
# #   machine_type = "e2-medium"
# #   region        = "southamerica-west1"

# #   # Create a new disk from an image and set as boot disk
# #   disk {
# #     source_image = "debian-cloud/debian-12"
# #     boot         = true
# #   }

# #   # Network Configurations 
# #   network_interface {
# #     subnetwork = google_compute_subnetwork.santiago.id
# #     /*access_config {
# #       # Include this section to give the VM an external IP address
# #     } */
# #   }

# #   # Install Webserver using file() function
# #   metadata_startup_script = file("./startup.sh")
# # }