data "oci_identity_availability_domains" "available" {

compartment_id = "${var.compartment_id}"

}

resource "oci_core_vcn" "my_vcn" {
    #Required
    cidr_block = "${var.vpc_cidr}"
    compartment_id = "${var.compartment_id}"
     display_name   = "${var.vcn_display_name}"
    
}

 resource "oci_core_internet_gateway" "myIGW" {
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_vcn.my_vcn.id}"
}



resource "oci_core_route_table" "my_route_table_public" {
    #Required
    compartment_id = "${var.compartment_id}"
    route_rules {
        #Required
        network_entity_id = "${oci_core_internet_gateway.myIGW.id}"

        #Optional
        cidr_block = "0.0.0.0/0"
        
    }
    vcn_id = "${oci_core_vcn.my_vcn.id}"

   
}

resource "oci_core_subnet" "tf_public_subnet" {
    
    count= 2
    
    #Required
    vcn_id = "${oci_core_vcn.my_vcn.id}"
    cidr_block = "${var.public_cidrs[count.index]}"
    availability_domain = "${lookup(data.oci_identity_availability_domains.available.availability_domains[count.index],"name")}"
    
    compartment_id = "${var.compartment_id}"
 
    

    #Optional
    
    freeform_tags = {"Department"= "developement"}
    route_table_id = "${oci_core_route_table.my_route_table_public.id}"
    display_name        = "tf_public_${count.index  + 1 }"
}

resource "oci_core_security_list" "tf_public_sl" {
  compartment_id = "${var.compartment_id}"
  vcn_id         = "${oci_core_vcn.my_vcn.id}"
  display_name   = "TFExampleSecurityList"

// allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }
  
   // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      source_port_range {
        "min" = 22
        "max" = 22
      }

     
      "min" = 22
      "max" = 22
    }
  }
  
  
  
   ingress_security_rules {
    protocol  = "6"         // tcp
    source    = "0.0.0.0/0"
  
}




}



resource "oci_core_default_route_table" "my_route_table_private" {
  manage_default_resource_id = "${oci_core_vcn.my_vcn.default_route_table_id}"

 
}

