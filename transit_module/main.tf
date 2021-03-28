# ---main/module---- 
data "aws_availability_zones" "azs" {

}

resource "random_shuffle" "az_list" {
  input = data.aws_availability_zones.azs.names
}

resource "aws_vpc" "dev_vpc_1" {
  count                = var.vpc_1
  cidr_block           = var.vpc_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "dev_vpc_1"
  }
  
}

resource "aws_vpc" "dev_vpc_2" {
  count                = var.vpc_2
  cidr_block           = var.vpc_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "dev_vpc_2"
  }
  
}

resource "aws_vpc" "dev_vpc_3" {
  count                = var.vpc_3
  cidr_block           = var.vpc_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "dev_vpc_3"
  }
  
}
resource "aws_route_table" "dev_vpc_rt" {
  count = var.vpc_1
  vpc_id = aws_vpc.dev_vpc_1[count.index].id
  tags = {
    "Name" = "dev_vpc_rt_1"
  }
}
resource "aws_subnet" "subnet_1" {
  count      = var.sub_1
  vpc_id     = aws_vpc.dev_vpc_1[count.index].id
  cidr_block = var.cidr_block[count.index]
  availability_zone = random_shuffle.az_list.result[count.index]

  tags = {
    "Name" = "dev_subnet_1"
  }

}

resource "aws_subnet" "subnet_2" {
  count      = var.sub_2
  vpc_id     = aws_vpc.dev_vpc_2[count.index].id
  cidr_block = var.cidr_block[count.index]
  availability_zone = random_shuffle.az_list.result[count.index]

  tags = {
    "Name" = "dev_subnet_2"
  }

}

resource "aws_subnet" "subnet_3" {
  count      = var.sub_3
  vpc_id     = aws_vpc.dev_vpc_3[count.index].id
  cidr_block = var.cidr_block[count.index]
  availability_zone = random_shuffle.az_list.result[count.index]

  tags = {
    "Name" = "dev_subnet_3"
  }

}
resource "aws_ec2_transit_gateway" "dev_vpc_tgw" {

  tags = {
      Name = "dev_vpc_tgw"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev_vpc_tgw_att_1" {
  count = var.transit_gateway_vpc_attachment_count
  transit_gateway_id = aws_ec2_transit_gateway.dev_vpc_tgw.id
  vpc_id = aws_vpc.dev_vpc_1[count.index].id
  subnet_ids = aws_subnet.subnet_1[*].id

  tags = {
      Name = "dev_vpc_tgw_att_1"
  }


}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev_vpc_tgw_att_2" {
  count = var.transit_gateway_vpc_attachment_count
  transit_gateway_id = aws_ec2_transit_gateway.dev_vpc_tgw.id
  vpc_id = aws_vpc.dev_vpc_2[count.index].id
  subnet_ids = aws_subnet.subnet_2[*].id

  tags = {
      Name = "dev_vpc_tgw_att_2"
  }


}


resource "aws_ec2_transit_gateway_vpc_attachment" "dev_vpc_tgw_att_3" {
  count = var.transit_gateway_vpc_attachment_count
  transit_gateway_id = aws_ec2_transit_gateway.dev_vpc_tgw.id
  vpc_id = aws_vpc.dev_vpc_3[count.index].id
  subnet_ids = aws_subnet.subnet_3[*].id

  tags = {
      Name = "dev_vpc_tgw_att_3"
  }

}
