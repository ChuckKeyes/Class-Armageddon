resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "kcs-https-proxy"
  ssl_certificates = [google_compute_managed_ssl_certificate.kcs_cert.id]
  url_map          = google_compute_url_map.kcs_urlmap.id
}
