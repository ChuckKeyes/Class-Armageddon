resource "google_compute_autoscaler" "rio_mig_autoscaler" {
  name   = "rio-mig-autoscaler"
  zone   = "southamerica-east1-b"
  target = google_compute_instance_group_manager.rio_mig.id

  autoscaling_policy {
    min_replicas = 2
    max_replicas = 5

    cpu_utilization {
      target = 0.6
    }

    cooldown_period = 60
  }
}
