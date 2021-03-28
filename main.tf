#---root/main---

module "transit" {
  source    = "./transit_module"
  vpc_count = 1
  sub_count = 1
  transit_gateway_vpc_attachment_count = 1
}