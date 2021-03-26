#---root/main---

module "transit" {
  source    = "./transit_module"
  vpc_count = 2
  sub_count = 1
}