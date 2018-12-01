resource "oci_identity_user" "test_user" {
    #Required
    compartment_id = "${var.tenancy_ocid}"
    description = "${var.user_description}"
    name = "${var.user_name}"

   
}
