# # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler
# # Resource: MIG Autoscaling
# resource "google_compute_region_autoscaler" "app-scaler" {
#   name   = "app-autoscaler"
#   target = google_compute_region_instance_group_manager.ck-app.id
#   region = "us-east1"

#   autoscaling_policy {
#     max_replicas    = 4
#     min_replicas    = 2
#     cooldown_period = 60

#     # 50% CPU for autoscaling event
#     cpu_utilization {
#       target = 0.5
#     }
#   }
# }

# resource "google_compute_region_autoscaler" "2app-scaler" {
#   name   = "2app-autoscaler"
#   target = google_compute_region_instance_group_manager.ck-app.id
#   region = "africa-south1"

#   autoscaling_policy {
#     max_replicas    = 4
#     min_replicas    = 2
#     cooldown_period = 60

#     # 50% CPU for autoscaling event
#     cpu_utilization {
#       target = 0.5
#     }
#   }
# }

# # #Managed instance group-1
# # resource "google_compute_region_instance_group_manager" "compute-group-1" {
# #   name     = "warsaw-witcher-group"
# #   region     = "europe-central2"
# #   version {
# #     instance_template = google_compute_instance_template.sub-1-template.id
# #     name              = "griffin"
# #   }
# #   base_instance_name = "visimir"
# #   target_size        = 2
# #     named_port {
# #     name = "http"
# #     port = 80
# #   }
# # }
