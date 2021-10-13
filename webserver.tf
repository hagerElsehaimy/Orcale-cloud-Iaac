
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
    display_name = var.instance_A_display_name
    fault_domain = var.fault_domain_A
    
    metadata = {
#       #  ssh_authorized_keys = var.ssh_public_key
        ssh_authorized_keys = file(var.ssh_public_key)
       # user_data = base64encode(file("./apache_init.sh"))
    }
    source_details {
        #Required
        source_id = var.web_image_id
        source_type = var.source_type
    }
    preserve_boot_volume = var.preserve_boot_volume
  
  provisioner "file" {
    source      = "apache_init.sh"
    destination = "/home/opc/apache_init.sh"
     connection {
    type     = "ssh"
    user     = "opc"
   # password = "${var.root_password}"
    private_key = file("private.key")
    host     = oci_core_instance.web_server_A.public_ip
    }
  }
   provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/apache_init.sh",
      "./apache_init.sh",
    ]
     connection {
    type     = "ssh"
    user     = "opc"
   # password = "${var.root_password}"
    private_key = file("private.key")
    host     = oci_core_instance.web_server_A.public_ip
    }
  }
}

resource "oci_core_instance" "web_server_B" {
    #Required
    availability_domain = data.oci_identity_availability_domains.availability_domain_name.availability_domains[0].name
    compartment_id = var.tenancy_ocid
    shape = var.instance_shape
   
    create_vnic_details {

        #Optional
        nsg_ids = [oci_core_network_security_group.web_network_security_group.id]
        subnet_id = oci_core_subnet.vcn-public-subnetB.id
    }
    display_name = var.instance_B_display_name
    fault_domain = var.fault_domain_B
    
    metadata = {
      #  ssh_authorized_keys = var.ssh_public_key
        ssh_authorized_keys = file(var.ssh_public_key)
        user_data = "${base64encode(file("./apache_init.sh"))}"
    }
    source_details {
        #Required
        source_id = var.web_image_id
        source_type = var.source_type
    }
    preserve_boot_volume = var.preserve_boot_volume
}
