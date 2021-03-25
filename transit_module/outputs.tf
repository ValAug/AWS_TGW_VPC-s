#---module/output---
output "vpc_names" {
  description = "The name of the VPC's"
  value       = [aws_vpc.dev_vpc[*].tags["Name"]]
}