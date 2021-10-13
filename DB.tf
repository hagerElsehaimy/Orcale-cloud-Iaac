# resource "oci_database_autonomous_database" "autonomous_database" {
#     #Required
#     compartment_id = var.tenancy_ocid
#     cpu_core_count = var.autonomous_database_cpu_core_count
#     db_name = var.autonomous_database_db_name

#     #Optional
#     admin_password = var.autonomous_database_admin_password
#     display_name = var.autonomous_database_db_name
#     is_free_tier = var.autonomous_database_is_free_tier
#     nsg_ids = [oci_core_network_security_group.db_network_security_group.id]
#     subnet_id = oci_core_subnet.vcn-private-subnet.id
# #    db_version = var.autonomous_database_db_version
#     data_storage_size_in_tbs = var.autonomous_database_data_storage_size_in_tbs
#     private_endpoint_label = var.autonomous_database_private_endpoint_label


# }