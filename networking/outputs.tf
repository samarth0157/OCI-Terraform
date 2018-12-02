#Networking /outputs.tf

output "public_subnets" { 

 value = "${oci_core_subnet.tf_public_subnet.*.id}"
 
 }
 
output "public_sg" {
    
    value = "${oci_core_security_list.tf_public_sl.id}"
    
} 

output "subnets_ips" {
    
    value = "${oci_core_subnet.tf_public_subnet.*.cidr_block}"
}
