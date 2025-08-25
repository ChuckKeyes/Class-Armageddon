resource "google_compute_url_map" "kcs_urlmap" {
  name = "kcs-urlmap"

  default_service = google_compute_backend_service.be_us.id

  # rio.*
  host_rule {
    hosts        = ["rio.keyescloudsolutions.com"]
    path_matcher = "pm-rio"
  }
  path_matcher {
    name            = "pm-rio"
    default_service = google_compute_backend_service.be_rio.id
  }

  # us.*
  host_rule {
    hosts        = ["us.keyescloudsolutions.com"]
    path_matcher = "pm-us"
  }
  path_matcher {
    name            = "pm-us"
    default_service = google_compute_backend_service.be_us.id
  }

  # africa.*
  host_rule {
    hosts        = ["africa.keyescloudsolutions.com"]
    path_matcher = "pm-africa"
  }
  path_matcher {
    name            = "pm-africa"
    default_service = google_compute_backend_service.be_africa.id
  }
}
