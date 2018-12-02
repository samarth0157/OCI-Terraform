# Gets a list of Availability Domains
 data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}



data "template_file" "user-init" {
    count = 2
    template = "${base64encode(file("${path.module}/userdata.tpl"))}"
    
    vars {
       firewall_subnets = "${element(var.subnets_ips,count.index)}"
    }
  }

resource "oci_core_instance" "my_instance" {
    
    count = "${var.instance_count}"
    availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[count.index],"name")}"
    compartment_id      =  "${var.compartment_ocid}"
    display_name        = "webservers"
     shape               = "${var.instance_shape}"
    
    create_vnic_details {
    subnet_id = "${element(var.subnets, count.index)}"    
    assign_public_ip = true

  }

   source_details { 
    source_type = "image"
    source_id   = "${var.instance_image_ocid[var.region]}" 
  } 

   metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data           = "${data.template_file.user-init.*.rendered[count.index]}"
  }

  }
