# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 6.0"
#     }
#     google-beta = {
#       source  = "hashicorp/google-beta"
#       version = "~> 6.0"
#     }
#   }
# }

# ----------------------------
# VPC (global) + 4 subnets
# ----------------------------
resource "google_compute_network" "foreign_vpc" {
  project                 = var.project_id
  name                    = var.foreign_vpc_name
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "subnet_japan" {
  name          = "subnet-japan"
  ip_cidr_range = "10.70.0.0/24"
  region        = "asia-northeast1"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_brazil" {
  name          = "subnet-brazil"
  ip_cidr_range = "10.80.0.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_italy" {
  name          = "subnet-italy"
  ip_cidr_range = "10.90.0.0/24"
  region        = "europe-west8"
  network       = google_compute_network.foreign_vpc.id
}

resource "google_compute_subnetwork" "subnet_thailand" {
  name          = "subnet-thailand"
  ip_cidr_range = "10.100.0.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.foreign_vpc.id
}

