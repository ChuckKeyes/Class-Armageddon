############################################################
# Maryland MIG
############################################################
resource "google_compute_instance_group_manager" "maryland_mig" {
  name               = "maryland-mig"
  zone               = "us-east1-b"
  base_instance_name = "maryland"
  target_size        = 1

  version {
    instance_template = google_compute_instance_template.maryland_tpl.id
  }

  named_port {
    name = "http"
    port = 80
  }
}
