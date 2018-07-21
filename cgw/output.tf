output "cgw_ip" {
  value       = "${aws_customer_gateway.cgw.ip_address}"
}
output "cgw_asn" {
  value       = "${aws_customer_gateway.cgw.bgp_asn}"
}
