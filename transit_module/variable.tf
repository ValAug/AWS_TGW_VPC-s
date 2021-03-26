# ---variable/module---
variable "vpc_count" {
  description = "Numbers of vpc to be deploy with their random string names"
  type        = number

  validation {
    condition     = var.vpc_count <= 4 && var.vpc_count >= 1
    error_message = "The amount of vpc's must be valid range 1 - 3."
  }
}

variable "sub_count" {
  description = "Numbers of vpc to be deploy with their random string names"
  type        = number
}

variable "cidr_block" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.3.0/24"
  ]
}