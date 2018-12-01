
variable "tenancy_ocid" {

default = "ocid1.tenancy.oc1..aaaaaaaafnbozefv3d7wqwi4hg6b2j3rjv2raxgmgya64445j63kf6645ovq"

}

variable "user_ocid" {

default = "ocid1.user.oc1..aaaaaaaaj4eb72gkbxubnf6wv4vl5xzr6exdm2ydrcnldaigv3bjxwlhcptq"

}


variable "fingerprint" {

default ="39:bf:e6:9b:90:18:35:3d:65:41:30:1b:b8:c3:03:b4"

}

variable "private_key_path" {

default ="/root/.oci/oci_api_key.pem" 


}

variable "compartment_ocid" {

default = "ocid1.compartment.oc1..aaaaaaaas3ezg6kigje2mnkgvqvknv6ow6klsrvpsc6of3a7gg75wwqjntoq"
}

variable "region" {

default ="us-phoenix-1"
}



variable "user_name" {

default = "samarth"

}

variable "user_desc" {
default ="this is a dev user" 
}

variable "vpc_cidr" {

 default = "10.123.0.0/16"
}


variable "public_cidrs" {

 type = "list"
 default = [ "10.123.1.0/24", "10.123.2.0/24" ]
}

variable "vcn_display_name" {

default ="samarthvcn" 
}

variable "accessip" {

default = "0.0.0.0/0" 

}


