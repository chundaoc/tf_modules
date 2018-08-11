variable "create_new_vpc" {
  description = "true or false)"
  default     = false
}

variable "region" {
  default = "us-east-2"
}

variable "vpc_tags" {
  type = "map"

  default = {
    vpn = "yes"
  }
}


variable "cidr_block" {
  description = "vpc cidr"
  default = "10.146.0.0/24"
}

variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_hostnames" {
  default = false
}

variable "enable_dns_support" {
  default = true
}

variable "availability_zones" {
  default = ["us-east-2a","us-east-2b"]
}

variable "map_public_ip_on_launch" {
  description = "True or false"
  default = true
}

variable "public_subnets" {
  default = ["10.146.0.0/27","10.146.0.32/27"]
}

variable "private_subnets" {
  default = ["10.146.0.128/27","10.146.0.160/27"]
}
