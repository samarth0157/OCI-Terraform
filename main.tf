

provider "oci" {
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.region}"
}



module "user" {

source = "./users"
tenancy_ocid ="${var.tenancy_ocid}"
user_name = "${var.user_name}"
user_description  = "${var.user_desc}"

}

module "networking"  {

source = "./networking"
    vpc_cidr ="${var.vpc_cidr}"
    public_cidrs ="${var.public_cidrs}"
    vcn_display_name = "${var.vcn_display_name}"
   compartment_id = "${var.compartment_ocid}"
}

