resource "oci_load_balancer_load_balancer" "load_balancer" {
    #Required
    compartment_id = var.tenancy_ocid
    display_name = "LB"
    shape = "10Mbps"
    subnet_ids = [oci_core_subnet.vcn-public-subnetA.id]

    #Optional
    ip_mode = "IPV4"
    is_private = "false"
    network_security_group_ids = [oci_core_network_security_group.lb_network_security_group.id]
}