#---module/output---
output "vpc_names" {
  description = "The name of the VPC's"
  value       = [aws_vpc.dev_vpc[*].tags["Name"]]
}

output "tgw_vpc_attachement" {
  description = "vpc attachment"
  value = [aws_ec2_transit_gateway_vpc_attachment.dev_vpc_tgw_att[*].vpc_id ]
}

output "tgw_subnet_attachement" {
  description = "vpc attachment"
  value = [aws_ec2_transit_gateway_vpc_attachment.dev_vpc_tgw_att[*].subnet_ids ]
}