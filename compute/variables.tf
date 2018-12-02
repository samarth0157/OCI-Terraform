variable "tenancy_ocid" {}
variable "instance_shape" {}
variable "compartment_ocid" {}


variable "availability_domain" {
  default = "2"
}


variable "instance_count" {}
variable "subnets" {

type = "list"

}

variable "ssh_public_key" {}

variable "subnets_ips" {

type = "list"

}



variable "instance_image_ocid" {

type = "map"

}

variable "region" {}
