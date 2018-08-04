provider "aws" {
  region = "${var.region}"
}

# VPC
resource "aws_vpc" "vpc" {
  count = "${var.create_new_vpc ? 1 : 0}"

  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags = "${var.vpc_tags}"
}

# PUBLIC SUBNET
resource "aws_subnet" "public" {
  count = "${var.create_new_vpc ? length(var.public_subnets) : 0}"

  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${element(var.availability_zones, count.index)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags {
    Name = "subnet_public_${count.index}"
  }
}

# PRIVATE SUBNET
resource "aws_subnet" "private" {
  count = "${var.create_new_vpc ? length(var.private_subnets) : 0}"

  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnets[count.index]}"
  availability_zone       = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "subnet_private_${count.index}"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  count = "${var.create_new_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "default_igw_tf"
  }
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "public" {
  count = "${var.create_new_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  vpc_id = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.vgw_id}"]

  tags {
    Name = "route_table_public"
  }
}

# ADD PUBLIC ROUTE
resource "aws_route" "public_internet_gateway" {
  count = "${var.create_new_vpc && length(var.public_subnets) > 0 ? 1 : 0}"

  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"

}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "private" {
  count = "${var.create_new_vpc && length(var.private_subnets) > 0 ? 1 : 0}" 

  vpc_id = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.vgw_id}"]

  tags {
    Name = "route_table_private"
  }
}

# ASSOCIATE SUBNETS TO ROUTE TABLES
resource "aws_route_table_association" "public" {
  count = "${var.create_new_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count = "${var.create_new_vpc && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0}"

  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

