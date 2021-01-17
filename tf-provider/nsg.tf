resource "oci_core_network_security_group" "lb_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = "LB"
}

resource "oci_core_network_security_group" "web_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = "WEB"
}

resource "oci_core_network_security_group" "db_network_security_group" {
    #Required
    compartment_id = var.tenancy_ocid
    vcn_id = module.vcn.vcn_id
    display_name = "DB"
}

resource "oci_core_network_security_group_security_rule" "lb_https" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "CIDR_BLOCK"
  source      = "0.0.0.0/0"
  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

resource "oci_core_network_security_group_security_rule" "lb_http" {
  network_security_group_id = oci_core_network_security_group.lb_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "CIDR_BLOCK"
  source      = "0.0.0.0/0"
  tcp_options {
    destination_port_range {
      min = 80
      max = 80
    }
  }
}


resource "oci_core_network_security_group_security_rule" "web_https" {
  network_security_group_id = oci_core_network_security_group.web_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "NETWORK_SECURITY_GROUP"
  source      = oci_core_network_security_group.lb_network_security_group.id
  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

resource "oci_core_network_security_group_security_rule" "web_http" {
  network_security_group_id = oci_core_network_security_group.web_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "NETWORK_SECURITY_GROUP"
  source      = oci_core_network_security_group.lb_network_security_group.id
  tcp_options {
    destination_port_range {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_network_security_group_security_rule" "db_https" {
  network_security_group_id = oci_core_network_security_group.db_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "NETWORK_SECURITY_GROUP"
  source      = oci_core_network_security_group.web_network_security_group.id
  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}

resource "oci_core_network_security_group_security_rule" "db_http" {
  network_security_group_id = oci_core_network_security_group.db_network_security_group.id

  description = "HTTPS"
  protocol = 6
  direction   = "INGRESS"
  source_type = "NETWORK_SECURITY_GROUP"
  source      = oci_core_network_security_group.web_network_security_group.id
  tcp_options {
    destination_port_range {
      min = 80
      max = 80
    }
  }
}