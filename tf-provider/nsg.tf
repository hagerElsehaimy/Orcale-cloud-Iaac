resource "oci_core_network_security_group" "lb_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = var.lb_sg_display_name
}

resource "oci_core_network_security_group" "web_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = var.web_sg_display_name

}

resource "oci_core_network_security_group" "db_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = var.db_sg_display_name

}

resource "oci_core_network_security_group_security_rule" "lb_https_ingress" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id

  description = var.https_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.cidr_type
  source      = var.all_traffic
  tcp_options {
    destination_port_range {
      min = var.https_port
      max = var.https_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_http_ingress" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id

  description = var.http_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.cidr_type
  source      = var.all_traffic
  tcp_options {
    destination_port_range {
      min = var.http_port
      max = var.http_port
    }
  }
}


resource "oci_core_network_security_group_security_rule" "web_https_ingress" {
  network_security_group_id = oci_core_network_security_group.web_network_security_group.id

  description = var.https_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.ingress_sg_type
  source      = oci_core_network_security_group.lb_network_security_group.id
  tcp_options {
    destination_port_range {
      min = var.https_port
      max = var.https_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "web_http_ingress" {
  network_security_group_id = oci_core_network_security_group.web_network_security_group.id

  description = var.http_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.ingress_sg_type
  source      = oci_core_network_security_group.lb_network_security_group.id
  tcp_options {
    destination_port_range {
      min = var.http_port
      max = var.http_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "db_https_ingress" {
  network_security_group_id = oci_core_network_security_group.db_network_security_group.id

  description = var.https_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.ingress_sg_type
  source      = oci_core_network_security_group.web_network_security_group.id
  tcp_options {
    destination_port_range {
      min = var.https_port
      max = var.https_port
    }
  }
}

resource "oci_core_network_security_group_security_rule" "db_http_ingress" {
  network_security_group_id = oci_core_network_security_group.db_network_security_group.id

  description = var.http_ingress_description
  protocol = var.ingress_protocol
  direction   = var.ingress_direction
  source_type = var.ingress_sg_type
  source      = oci_core_network_security_group.web_network_security_group.id
  tcp_options {
    destination_port_range {
      min = var.http_port
      max = var.http_port
    }
  }
}




resource "oci_core_network_security_group_security_rule" "lb_egress" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id

  description = var.egress_description
  protocol = var.egress_protocol
  direction   = var.egress_direction
  destination_type = var.cidr_type
  destination  = var.all_traffic
}

resource "oci_core_network_security_group_security_rule" "web_egress" {
  network_security_group_id = oci_core_network_security_group.web_network_security_group.id

  description = var.egress_description
  protocol = var.egress_protocol
  direction   = var.egress_direction
  destination_type = var.cidr_type
  destination  = var.all_traffic
}

resource "oci_core_network_security_group_security_rule" "db_egress" {
  network_security_group_id = oci_core_network_security_group.db_network_security_group.id

  description = var.egress_description
  protocol = var.egress_protocol
  direction   = var.egress_direction
  destination_type = var.cidr_type
  destination  = var.all_traffic
}