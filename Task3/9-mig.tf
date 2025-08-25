# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones
# # Datasource: Get a list of Google Compute zones that are UP in a region
# data "google_compute_zones" "available" {
#   status = "UP"
#   region = "us-east1"
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "ck-app" {
#   depends_on         = [google_compute_router_nat.nat-maryland]
#   name               = "ck-app-mig"
#   base_instance_name = "ck-app"
#   region = "us-east1"

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available.names

#   # Instance Template
#   version {
#     instance_template = google_compute_region_instance_template.ck-maryland.id
#   }

#   # Named Port
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.cek-app-health.id
#     initial_delay_sec = 300
#   }
# }

# #############################################################################################

# data "google_compute_zones" "available" {
#   status = "UP"
#   region = "us-east1"
# }

# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager
# # Resource: Managed Instance Group
# resource "google_compute_region_instance_group_manager" "ck2-app" {
#   depends_on         = [google_compute_router_nat.nat-maryland]
#   name               = "ck-app-mig"
#   base_instance_name = "ck-app"
#   region = "us-east1"

#   # Compute zones to be used for VM creation
#   distribution_policy_zones = data.google_compute_zones.available.names

#   # Instance Template
#   version {
#     instance_template = google_compute_region_instance_template.ck-maryland.id
#   }

#   # Named Port
#   named_port {
#     name = "webserver"
#     port = 80
#   }

#   # Autohealing Config
#   auto_healing_policies {
#     health_check      = google_compute_region_health_check.cek-app-health.id
#     initial_delay_sec = 300
#   }
# }
