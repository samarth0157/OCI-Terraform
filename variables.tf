
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

variable "public_key_path" {

default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvpr5uB1spB34aozJuUvvGbp564VeBHLTX5AKL4LXOgSVdNu5/rVKXJB9Di5j4qo4LyCQkbtIhiuGn/SqqtUfSthfUgs046GD33PLtkZAypTHvI3o4LjqRK8/0byRfKChbe9fR97gGdapjLuGVBs+MYYvPBbMtIDUl1nVKMbggJJTke7oBNPbq25ePScq1nN7AFeUX2cO7YWrVxnmmPJUpZFQ099Zr7f18hgovU/7lO25ryt45+BEOwca1M/6nCFGtvHhXvfr92a3k1WnG4hGjVc67+1TIt1gg4TTPAz4DtP61DLEbCRYEoC95WAMuwxkwdqZVpk+yhXvQ9v2ZVrvX root@terraform"

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
 default = [ "10.123.1.0/24", "10.123.2.0/24"]
}

variable "vcn_display_name" {

default ="samarthvcn" 
}

variable "accessip" {

default = "0.0.0.0/0" 

}

#Compute variables 

variable "instance_shape" {
 default = "VM.Standard2.1"
}


variable "availability_domain" {
 
 default = 2
}

variable "instance_count" {
 
 default = 2
}

variable "instance_image_ocid" {

type = "map"

  default = {
    // See https://docs.us-phoenix-1.oraclecloud.com/images/
    // Oracle-provided image "Oracle-Linux-7.4-2018.02.21-1"
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaaupbfz5f5hdvejulmalhyb6goieolullgkpumorbvxlwkaowglslq"

    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaajlw3xfie2t5t52uegyhiq2npx7bqyu4uvi2zyu3w3mqayc2bxmaa"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7d3fsb6272srnftyi4dphdgfjf6gurxqhmv6ileds7ba3m2gltxq"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaaa6h6gj6v4n56mqrbgnosskq63blyv2752g36zerymy63cfkojiiq"
  }

}


