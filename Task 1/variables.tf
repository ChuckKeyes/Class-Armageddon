variable "project_id" { type = string }
variable "foreign_vpc_name" { type = string }
# variable "prefix" { type = string }

# BGP
variable "foreign_bgp_asn" { type = number }  # e.g., 64514
variable "hq_bgp_asn"      { type = number }  # must be different

# HQ side (GCP↔GCP)
variable "hq_ha_vpn_self_link" { type = string }  # self_link of HQ HA VPN gateway

# Shared secret for both tunnels
variable "shared_secret" { type = string }

# /30 linknets for the two tunnels (local .1, HQ .2)
variable "linknet1_cidr" { type = string }  # e.g., "169.254.11.1/30"
variable "linknet2_cidr" { type = string }  # e.g., "169.254.12.1/30"

# HQ peer IPs (the .2 in each /30)
variable "hq_peer1_ip" { type = string }     # e.g., "169.254.11.2"
variable "hq_peer2_ip" { type = string }     # e.g., "169.254.12.2"

# Optional extra routes to advertise (beyond ALL_SUBNETS)
variable "extra_advertised_ranges" {
  description = "List of {range, description} to advertise in BGP"
  type = list(object({
    range       = string
    description = optional(string)
  }))
  default = []
}

###################################################################################
#######                 VM variables      #########################################
###################################################################################

variable "prefix" {
  description = "Name prefix for resources"
  type        = string
  default     = "foreign"
}

variable "vm_machine_type" {
  description = "Machine type for test VMs"
  type        = string
  default     = "e2-micro"
}

variable "vm_disk_gb" {
  description = "Boot disk size (GB) for test VMs"
  type        = number
  default     = 10
}

variable "vm_public_ip" {
  description = "Whether to attach an ephemeral public IP to test VMs"
  type        = bool
  default     = true
}
