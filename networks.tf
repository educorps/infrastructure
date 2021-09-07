resource "google_compute_network" "vpc_network" {
    project = var.project
    name = var.network
    auto_create_subnetworks = false
    mtu = 1460
    
}

resource "google_compute_subnetwork" "master-gke" {
 name          = "omar-master-gke"
 ip_cidr_range = var.ip_master
 project = var.project
 network       = var.network
 depends_on    = ["google_compute_network.vpc_network"]
 region      = var.region
}

resource "google_compute_subnetwork" "nodes" {
 name          = "omar-subnet-nodes"
 ip_cidr_range = var.ip_nodes
 project = var.project
 network       = var.network
 depends_on    = ["google_compute_network.vpc_network"]
 region      = var.region
 secondary_ip_range {
    range_name    = "secondary-ip-range-services"
    ip_cidr_range = var.ip_services
  }
 secondary_ip_range {
    range_name    = "secondary-ip-range-pods"
    ip_cidr_range = var.ip_pods
  }
}