# terraform.tfvars

# Foreign side BGP ASN (must differ from HQ)
foreign_bgp_asn = 65421

# Name of the foreign VPC
foreign_vpc_name = "foreign-vpc"

# HQ side BGP ASN
hq_bgp_asn = 65420

# Self-link of the HQ HA VPN Gateway
hq_ha_vpn_self_link = "projects/hq-project/global/haVpnGateways/hq-ha-vpn"

# HQ BGP peer IPs (endpoints of the two linknets)
hq_peer1_ip = "169.254.11.2"
hq_peer2_ip = "169.254.12.2"

# Linknet CIDR ranges (foreign side)
linknet1_cidr = "169.254.11.1/30"
linknet2_cidr = "169.254.12.1/30"

# Foreign project ID
project_id = "ck-armageddon"

# Shared secret for VPN tunnels (IKEv2)
shared_secret = "REPLACE_WITH_STRONG_SECRET"
