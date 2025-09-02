resource "google_compute_instance_group_manager" "rio_mig" {
  name               = "rio-mig"
  zone               = "southamerica-east1-b"
  base_instance_name = "rio"

  version {
    name              = "primary"
    instance_template = google_compute_instance_template.rio_tmpl.self_link
  }

  target_size = 2 # how many VMs you want in the group

  # Graceful rolling updates
  update_policy {
    type                           = "PROACTIVE"
    minimal_action                 = "REPLACE"
    most_disruptive_allowed_action = "REPLACE"
    max_unavailable_fixed          = 1
    replacement_method             = "SUBSTITUTE"
  }

  # Helpful if you later attach an HTTP LB (sets a named port on the group)
  named_port {
    name = "http"
    port = 80
  }
}
