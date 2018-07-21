provider "aws" {
  region = "${var.region}"
}

resource "aws_vpn_gateway_attachment" "attach" {
  vpc_id         = "${var.vpc_id}"
  vpn_gateway_id = "${var.vgw_id}"
}

