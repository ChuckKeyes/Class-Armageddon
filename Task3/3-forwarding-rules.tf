resource "google_compute_global_forwarding_rule" "fr_https_v4" {
  name                  = "kcs-https-v4"
  ip_protocol           = "TCP"
  port_range            = "443"
  target                = google_compute_target_https_proxy.https_proxy.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_address            = google_compute_global_address.lb_ip_v4.address
}

resource "google_compute_global_forwarding_rule" "fr_https_v6" {
  name                  = "kcs-https-v6"
  ip_protocol           = "TCP"
  port_range            = "443"
  target                = google_compute_target_https_proxy.https_proxy.id
  load_balancing_scheme = "EXTERNAL_MANAGED"
  ip_address            = google_compute_global_address.lb_ip_v6.address
}
