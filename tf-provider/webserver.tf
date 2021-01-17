data "oci_identity_availability_domains" "availability_domain_name" {
    #Required
    compartment_id = var.tenancy_ocid
}


resource "oci_core_instance" "web_server_A" {
    #Required
    availability_domain = data.oci_identity_availability_domains.availability_domain_name.availability_domains[0].name
    compartment_id = var.tenancy_ocid
    shape = var.instance_shape
   
    create_vnic_details {

        #Optional
        nsg_ids = [oci_core_network_security_group.web_network_security_group.id]
        subnet_id = oci_core_subnet.vcn-public-subnetB.id
    }
    display_name = var.instance_display_name
    fault_domain = var.instance_fault_domain
    
    metadata = {
        user_data = base64encode(file(var.custom_bootstrap_file_name))
    }
    source_details {
        #Required
        source_id = var.web_image_id
        source_type = var.source_type
    }
    preserve_boot_volume = var.preserve_boot_volume
}
