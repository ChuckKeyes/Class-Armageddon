############################################################
# Maryland instance template (backend)
############################################################
resource "google_compute_instance_template" "maryland_tpl" {
  name_prefix  = "maryland-tpl-"
  machine_type = "e2-micro"
  tags         = ["lb-backend", "maryland"]

  disk {
    boot         = true
    auto_delete  = true
    source_image = "projects/debian-cloud/global/images/family/debian-12"
  }

  # No access_config = no external IP (backend lives behind LB)
  network_interface {
    subnetwork = google_compute_subnetwork.maryland.id
  }

#  metadata_startup_script = file("${path.module}/startup2.sh")
   metadata_startup_script = file("${path.module}/37-startup2-fixed.sh")

}
