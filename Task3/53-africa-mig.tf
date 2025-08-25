resource "google_compute_instance_group_manager" "africa_mig" {
  name               = "africa-mig"
  zone               = "africa-south1-a"
  base_instance_name = "africa"

  version {
    name              = "primary"
    instance_template = google_compute_instance_template.africa_tmpl.self_link
  }

  target_size = 2 # adjust as needed

  update_policy {
    type                           = "PROACTIVE"
    minimal_action                 = "REPLACE"
    most_disruptive_allowed_action = "REPLACE"
    max_unavailable_fixed          = 1
    replacement_method             = "SUBSTITUTE"
  }

  # For HTTP LB attachment
  named_port {
    name = "http"
    port = 80
  }
}
