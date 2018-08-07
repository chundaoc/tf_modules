resource "aws_customer_gateway" "cgw" {
  bgp_asn    = "${var.cgw_asn}"
  ip_address = "${var.cgw_ip}"
  type       = "ipsec.1"

  tags {
    Name = "cgw_${var.cgw_ip}"
  }
}

output "id" {
  value = "${aws_customer_gateway.cgw.id}"
}
