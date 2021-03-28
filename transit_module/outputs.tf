# #---module/output---
output "transit_gateway_name" {
  description = "The name of the transit_gateway"
  value       = [aws_ec2_transit_gateway.dev_vpc_tgw.tags["Name"]]
}


output "tgw_attachements_1" {
  description = "vpc attachment"
  value = [for i in aws_ec2_transit_gateway_vpc_attachment.dev_vpc_tgw_att_1[*] : join(" <--same-tgw-- ",[i.transit_gateway_id, i.vpc_id ])]
}

output "tgw_attachements_2" {
  description = "vpc attachment"
  value = [for i in aws_ec2_transit_gateway_vpc_attachment.dev_vpc_tgw_att_2[*] : join(" <--same-tgw-- ",[i.transit_gateway_id, i.vpc_id ])]
}

output "tgw_attachements_3" {
  description = "vpc attachment"
  value = [for i in aws_ec2_transit_gateway_vpc_attachment.dev_vpc_tgw_att_3[*] : join(" <--same-tgw-- ",[i.transit_gateway_id, i.vpc_id ])]
}
