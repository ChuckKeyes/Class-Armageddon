#!/bin/bash
set -euo pipefail

# Update and install Apache2
apt-get update -y
apt-get install -y apache2 apache2-doc curl

systemctl enable --now apache2

# Metadata server
MD="http://metadata.google.internal/computeMetadata/v1"
H="Metadata-Flavor: Google"

local_ipv4=$(curl -H "$H" -s "${MD}/instance/network-interfaces/0/ip")
zone=$(curl -H "$H" -s "${MD}/instance/zone" | awk -F/ '{print $NF}')
project_id=$(curl -H "$H" -s "${MD}/project/project-id")
network_tags=$(curl -H "$H" -s "${MD}/instance/tags")

# Fetch base64-encoded rio.jpeg from instance metadata and write file
curl -H "$H" -s "${MD}/instance/attributes/rio_b64" | base64 -d > /var/www/html/rio.jpeg

# Simple web page
cat > /var/www/html/index.html <<EOF
<html><body>
<h1>Charles Keyes</h1>
<h2>Welcome to your custom website.</h2>
<h3>Created by startup.sh on first boot</h3>
<img src="rio.jpeg" alt="Rio" style="max-width:480px;display:block;margin:16px 0;" />
<p><b>Instance Name:</b> $(hostname -f)</p>
<p><b>Private IP:</b> ${local_ipv4}</p>
<p><b>Zone:</b> ${zone}</p>
<p><b>Project ID:</b> ${project_id}</p>
<p><b>Network Tags:</b> ${network_tags}</p>
</body></html>
EOF

# Harden Apache a little (optional)
a2dismod -f autoindex || true
systemctl restart apache2
