resource "google_compute_autoscaler" "africa_autoscaler" {
  name   = "africa-mig-autoscaler"
  zone   = "africa-south1-a"
  target = google_compute_instance_group_manager.africa_mig.id

  autoscaling_policy {
    min_replicas = 2
    max_replicas = 5
    cpu_utilization { target = 0.6 }
    cooldown_period = 60
  }
}
