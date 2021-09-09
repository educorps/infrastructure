variable project {}
variable region {}
variable network {}
variable ip_master {}
variable ip_nodes {}
variable ip_services {}
variable ip_pods {}
variable name {}
variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}