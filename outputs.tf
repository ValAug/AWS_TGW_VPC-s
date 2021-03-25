#--root/output---
output "vpc_info" {
  description = "vpc-info"
  value = [for x in module.transit[*] : x]
}