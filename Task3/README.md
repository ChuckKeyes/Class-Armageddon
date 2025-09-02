class armageddon

Task 3: 
The Operations team wants to ensure scalability for their applications. Complete "Be a Man #5", but now creating a Linux VM in a separate region for each group member. Firewall tag for each Linux VM must be named after each group member, and the Windows VM must be able to access all Linux VMs. Step by step guide must be provided within the readme for task 3. There must be a .tf file for each participating member, complete with comments. This will be in terraform.

Steps for a load balancer in 2 regions.

 Load balancer summary 

1.	The user makes a request to the application, which is deployed on Compute Engine. The request first lands on Cloud Load Balancing.
2.	Cloud Load Balancing distributes traffic to the Compute Engine managed instance group (MIG), which scales the number of instances based on traffic volume.

 Instance group 
1.	An instance group is a collection of virtual machine (VM) instances that you can manage as a single entity.
2.	A MIG is a collection of virtual machine (VM) instances that you can manage as a single entity

Firewall rules
1.	Firewall rules allow or deny ingress traffic to, and egress traffic from your instances.
2.	In a custom Virtual Private Cloud (VPC) network with multiple subnets, by default, egress traffic is allowed, but ingress traffic is denied. 
3.	To enable ingress traffic and allow VM instances in different subnets to communicate with each other, you can create a global network firewall policy in Cloud Next Generation Firewall on the VPC network, which allows ingress traffic from a specific IP address range of the subnet.			

 RDP server 
1.	Allow ingress RDP connections to VMs. 
2.	Create a firewall rule to allow Microsoft Remote Desktop Protocol (RDP) connections to your VM.

Load balanced web app
1.	GDC provides load balancers that enable applications to expose services to one another.  
2.	Load balancers in GDC perform layer four (L4) load balancing, which means they map a set of configured frontend TCP or UDP ports to corresponding backend ports.   
