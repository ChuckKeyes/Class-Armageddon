# Health check shared by all backends
resource "google_compute_health_check" "hc" {
  name = "kcs-hc"
  http_health_check {
    port         = 80
    request_path = "/"
  }
  check_interval_sec  = 10
  healthy_threshold   = 2
  unhealthy_threshold = 3
  timeout_sec         = 5
}

# Backend: Rio
resource "google_compute_backend_service" "be_rio" {
  name                  = "be-rio"
  protocol              = "HTTP"
  port_name             = "http" # must match MIG named_port
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_health_check.hc.id]

  backend {
    group = google_compute_instance_group_manager.rio_mig.instance_group
  }
}

# Backend: US
resource "google_compute_backend_service" "be_us" {
  name                  = "be-us"
  protocol              = "HTTP"
  port_name             = "http"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_health_check.hc.id]

   backend {
    group           = google_compute_instance_group_manager.maryland_mig.instance_group
    balancing_mode  = "UTILIZATION"
    max_utilization = 0.8
  }
}

# Backend: Africa
resource "google_compute_backend_service" "be_africa" {
  name                  = "be-africa"
  protocol              = "HTTP"
  port_name             = "http"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_health_check.hc.id]

  backend {
    group = google_compute_instance_group_manager.africa_mig.instance_group
  }
}

# resource "google_compute_router_nat" "main_nat" {
#   # ...existing config...
#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

#   subnetwork {
#     name                    = google_compute_subnetwork.maryland.id
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }
# }
