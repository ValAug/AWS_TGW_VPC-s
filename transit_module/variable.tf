# ---variable/module---
variable "vpc_1" {
  description = "Numbers of vpc to be deploy with their random string names"
  type        = number

  validation {
    condition     = var.vpc_1 <= 4 && var.vpc_1 >= 1
    error_message = "The amount of vpc's must be valid range 1 - 3."
  }
}

variable "vpc_2" {
  description = "Numbers of vpc to be deploy with their random string names"
  type        = number

  validation {
    condition     = var.vpc_2 <= 4 && var.vpc_2 >= 1
    error_message = "The amount of vpc's must be valid range 1 - 3."
  }
}

variable "vpc_3" {
  description = "Numbers of vpc to be deploy with their random string names"
  type        = number

  validation {
    condition     = var.vpc_3 <= 4 && var.vpc_3 >= 1
    error_message = "The amount of vpc's must be valid range 1 - 3."
  }
}
variable "sub_1" {
  description = "Numbers of subnets to be deploy within a VPC"
  type        = number
}

variable "sub_2" {
  description = "Numbers of subnets to be deploy within a VPC"
  type        = number
}

variable "sub_3" {
  description = "Numbers of subnets to be deploy within a VPC"
  type        = number
}

variable "transit_gateway_vpc_attachment_count"{
    description = "Numbers of gateway vpc attachment"
    type        = number
}
variable "vpc_block"{
    type = string
    default = "10.0.0.0/16"
}
variable "cidr_block" {
  type = list(string)
  default = [
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
  ]
}

variable "dest_cidr"{
  default = "162.1.0.0/16"
}