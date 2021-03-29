#---root/main---

module "transit" {
  source    = "./transit_module"
  vpc_1 = 1
  vpc_2 = 1
  vpc_3 = 1
  sub_1 = 1
  sub_2 = 1
  sub_3 = 1
  transit_gateway_vpc_attachment_count = 1
}