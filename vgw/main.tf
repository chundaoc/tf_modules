provider "aws" {
  region = "${var.region}"
}

resource "aws_vpn_gateway" "vgw" {
  amazon_side_asn   = "${var.vgw_asn}"

  tags {
    Name = "vgw_${var.region}"
  }
}

output "id" {
  value = "${aws_vpn_gateway.vgw.id}"
}


