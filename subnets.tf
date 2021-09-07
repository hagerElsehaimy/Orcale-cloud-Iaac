resource "oci_core_subnet" "vcn-public-subnetA"{

  # Required
  compartment_id = var.tenancy_ocid
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.0.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  display_name = "LB-Tier-public-subnet"
}

resource "oci_core_subnet" "vcn-public-subnetB"{

  # Required
  compartment_id = var.tenancy_ocid
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.1.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  display_name = "webserver-Tier-public-subnet"
}

resource "oci_core_subnet" "vcn-private-subnet"{

  # Required
  compartment_id = var.tenancy_ocid
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.2.0/24"
 
  # Optional
  route_table_id = module.vcn.nat_route_id
  display_name = "DB-Tier-private-subnet"
  dns_label = var.subnet_dns_label
}