provider "aws" {
  region = "${var.region}"
}

resource "aws_vpn_connection" "conn" {
  vpn_gateway_id      = "${var.vgw_id}"
  customer_gateway_id = "${var.cgw_id}"
  type                = "ipsec.1"
  static_routes_only  = false

  tags {
    Name = "conn_${var.region}"
  }
}

