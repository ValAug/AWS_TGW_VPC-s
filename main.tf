#---root/main---

module "transit" {
  source    = "./transit_module"
  vpc_count = 1
}