# resource "google_compute_health_check" "hc" {
#   name = "kcs-hc"
#   http_health_check {
#     port         = 80
#     request_path = "/"
#   }
#   check_interval_sec  = 10
#   healthy_threshold   = 2
#   unhealthy_threshold = 3
#   timeout_sec         = 5
# }
