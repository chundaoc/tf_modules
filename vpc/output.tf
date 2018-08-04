output "vpc_id" {
  value = "${element(concat(aws_vpc.vpc.*.id, list("")),0)}"
}

output "public_subnets" {
  value       = ["${aws_subnet.public.*.id}"]
}

output "public_subnets_cidr_blocks" {
  value       = ["${aws_subnet.public.*.cidr_block}"]
}

output "private_subnets" {
  value       = ["${aws_subnet.private.*.id}"]
}

output "private_subnets_cidr_blocks" {
  value       = ["${aws_subnet.private.*.cidr_block}"]
}
