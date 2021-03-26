# ---main/module---- 
data "aws_availability_zones" "azs" {
  
}

resource "random_shuffle" "az_list" {
  input = data.aws_availability_zones.azs.names
}
resource "random_string" "vpc_random" {
  count   = var.vpc_count
  length  = 4
  special = true

}
resource "aws_vpc" "dev_vpc" {
  count                = var.vpc_count
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = join("-", ["dev_vpc", random_string.vpc_random[count.index].result])
  }
  lifecycle {
    ignore_changes = [tags["Name"]]
  }
}

resource "aws_route_table" "dev_vpc_rt" {
  count = var.vpc_count
  vpc_id = aws_vpc.dev_vpc[count.index].id
  tags = {
    "Name" = "dev_vpc_rt"
  }
}
resource "aws_subnet" "subnet" {
  count      = var.sub_count
  vpc_id     = aws_vpc.dev_vpc[count.index].id
  cidr_block = var.cidr_block[count.index]
  availability_zone = random_shuffle.az_list.result[count.index]

  tags = {
    "Name" = "dev_subnet"
  }

}

resource "aws_ec2_transit_gateway" "dev_vpc_tgw" {
  count = var.vpc_count
  tags = {
      Name = "dev_vpc_tgw"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev_vpc_tgw_att" {
  count = 2
  transit_gateway_id = aws_ec2_transit_gateway.dev_vpc_tgw[count.index].id
  vpc_id = aws_vpc.dev_vpc[count.index].id
  subnet_ids = aws_subnet.subnet[*].id

  tags = {
      Name = "dev_vpc_tgw_att"
  }
}
