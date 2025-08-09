variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "ncc_hub_id" {
  description = "Fully-qualified NCC Hub resource ID"
  type        = string
}

variable "foreign_vpc_name" {
  description = "Name for the foreign testers VPC"
  type        = string
  default     = "vpc-foreign-testers"
}

variable "foreign_vpc_subnets" {
  description = "Map of subnet configurations by country"
  type = map(object({
    region        = string
    ip_cidr_range = string
  }))
  default = {
    japan = {
      region        = "asia-northeast1"
      ip_cidr_range = "10.70.0.0/24"
    },
    brazil = {
      region        = "southamerica-east1"
      ip_cidr_range = "10.80.0.0/24"
    },
    italy = {
      region        = "europe-west8"
      ip_cidr_range = "10.90.0.0/24"
    },
    thailand = {
      region        = "asia-southeast1"
      ip_cidr_range = "10.100.0.0/24"
    }
  }
}

variable "vpn_shared_secret" {
  description = "Shared secret for HA VPN tunnels"
  type        = string
}

variable "vpn_peer_asn" {
  description = "ASN of the peer VPN router"
  type        = number
}

variable "peer_vpn_gateway_id" {
  description = "Fully-qualified resource ID of the peer HA VPN gateway"
  type        = string
}
