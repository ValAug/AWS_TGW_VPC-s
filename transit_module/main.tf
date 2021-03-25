# ---main/module---- 

resource "random_string" "vpc_random" {
    count = var.vpc_count
    length = 4
    special = true
  
}
resource "aws_vpc" "dev_vpc" {
  count = var.vpc_count
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true


  tags = {
    "Name" = join("-", ["dev_vpc", random_string.vpc_random[count.index].result])
  }
}

resource "aws_subnet" "subnet" {
  count = 1  
  vpc_id = aws_vpc.dev_vpc[count.index].id
  cidr_block = "10.0.1.0/24"
}