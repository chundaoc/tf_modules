variable "region" {
  description = "The region the vgw is created"
  default = "us-east-2"
}

variable "vpc_id" {
  description = "vpc id the vgw is attached to"
}

variable "vgw_id" {
  description = "vgw id to be attached"
}

variable "route_table_id" {
  description = "propagate routes to private route table"
}
