provider "aws" {
  region = "${var.region}"
}

resource "aws_customer_gateway" "cgw" {
  bgp_asn    = "${var.cgw_asn}"
  ip_address = "${var.cgw_ip}"
  type       = "ipsec.1"

  tags {
    Name = "cgw_${var.region}"
  }
}

output "id" {
  value = "${aws_customer_gateway.cgw.id}"
}
