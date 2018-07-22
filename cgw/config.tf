variable "region" {
  description = "The region vpn connection is terminated to"
  default = "us-east-2"
}

variable "cgw_asn" {
  description = "cgw bgp asn"
}

variable "cgw_ip" {
  description = "cgw ip address"
}
