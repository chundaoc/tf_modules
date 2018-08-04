provider "aws" {
  region = "${var.region}"
}

# VPC
resource "aws_vpc" "vpc" {
  count = "${var.create_vpc ? 1 : 0}"

  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name = "vpc_${var.region}_${var.cidr_block}"
  }
}

# PUBLIC SUBNET
resource "aws_subnet" "public" {
  count = "${var.create_vpc ? length(var.public_subnets) : 0}"

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
  count = "${var.create_vpc ? length(var.private_subnets) : 0}"

  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnets[count.index]}"
  availability_zone       = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "subnet_private_${count.index}"
  }
}
