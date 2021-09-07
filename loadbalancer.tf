resource "oci_load_balancer_load_balancer" "load_balancer_A" {
    #Required
    compartment_id = var.tenancy_ocid
    display_name = var.lb1_display_name
    shape = var.shape
    subnet_ids = [oci_core_subnet.vcn-public-subnetA.id]

    #Optional
    ip_mode = var.lb_ip_mode
    is_private = var.is_private
    network_security_group_ids = [oci_core_network_security_group.lb_network_security_group.id]
}

resource "oci_load_balancer_backend_set" "lb_backend_set" {
    #Required
    health_checker {
        #Required
        protocol = var.listener_protocol
        url_path = var.backend_set_health_checker_url_path

    }
    load_balancer_id = oci_load_balancer_load_balancer.load_balancer_A.id
    name = var.backend_set_name
    policy = var.backend_set_policy

}

resource "oci_load_balancer_backend" "lb_backend_A" {
    #Required
    backendset_name = oci_load_balancer_backend_set.lb_backend_set.name
    ip_address = oci_core_instance.web_server_A.public_ip
    load_balancer_id = oci_load_balancer_load_balancer.load_balancer_A.id
    port = var.http_port
}

resource "oci_load_balancer_backend" "lb_backend_B" {
    #Required
    backendset_name = oci_load_balancer_backend_set.lb_backend_set.name
    ip_address = oci_core_instance.web_server_B.public_ip
    load_balancer_id = oci_load_balancer_load_balancer.load_balancer_A.id
    port = var.http_port
}

resource "oci_load_balancer_listener" "lb_listener" {
    #Required
    default_backend_set_name = oci_load_balancer_backend_set.lb_backend_set.name
    load_balancer_id = oci_load_balancer_load_balancer.load_balancer_A.id
    name = var.listener_name
    port = var.http_port
    protocol = var.listener_protocol
}