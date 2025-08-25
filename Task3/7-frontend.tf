# 1) Frontend IP(s)
resource "google_compute_global_address" "lb_ip_v4" {
  name = "kcs-ipv4"
}
resource "google_compute_global_address" "lb_ip_v6" {
  name       = "kcs-ipv6"
  ip_version = "IPV6"
}

# 2) Cert (Managed)
resource "google_compute_managed_ssl_certificate" "kcs_cert" {
  name = "kcs-cert"
  managed {
    domains = [
      "rio.keyescloudsolutions.com",
      "us.keyescloudsolutions.com",
      "africa.keyescloudsolutions.com",
      "brazil.keyescloudsolutions.com"
    ]
  }
}
