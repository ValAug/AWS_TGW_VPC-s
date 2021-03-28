#--root/output---
output "transit_gateway_info" {
  description = "transit_gateway_info"
  value       = [for x in module.transit[*] : x]
}
