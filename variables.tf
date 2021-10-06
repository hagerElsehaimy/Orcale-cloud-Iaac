variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaadus45gcw2hf7r6a5wfjegzovazmxqemryxhto5phlt2gpalpcahq"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaavurwybmsv4mhuo656rnfhisho6oqkn6yim5xfw4aw7it3d2l5hda"
}

variable "fingerprint" {
  default = "49:42:ba:b3:86:6c:ad:1c:21:a7:b5:65:c0:7c:9c:f0"
}
variable "region_identifier" {
  default = "eu-frankfurt-1"
}
variable "private_key_path"{
    default = "/Users/hager/.oci/oci.pem"
}
variable "instance_shape"{
    default = "VM.Standard.E2.1.Micro"
}
variable "instance_A_display_name"{
  default = "webserver A"
}
variable "instance_B_display_name"{
  default = "webserver B"
}
variable "fault_domain_A"{
  default = "FAULT-DOMAIN-1"
}
variable "fault_domain_B"{
  default = "FAULT-DOMAIN-2"
}
variable "web_image_id"{
  default = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa5nbzzqouuczihfspsj4a23asfocaut4yucp7bvipqrt7vah6ylbq"
}
variable "preserve_boot_volume"{
  default = "false"
}
variable "custom_bootstrap_file_name"{
  default = "./apache_init.sh"
}
variable "source_type"{
  default = "image"
}
variable "egress_description"{
  default = "All traffic"
}
variable "all_traffic"{
  default = "0.0.0.0/0"
}
variable "cidr_type"{
  default = "CIDR_BLOCK"
}
variable "egress_direction"{
  default = "EGRESS"
}
variable "egress_protocol"{
  default = "all"
}
variable "lb_sg_display_name"{
  default = "LB_SG"
}
variable "web_sg_display_name"{
  default = "WEB_SG"
}
variable "db_sg_display_name"{
  default = "DB_SG"
}

variable "https_ingress_description"{
  default = "HTTPS"
}
variable "http_ingress_description"{
  default = "HTTP"
}

variable "ingress_protocol"{
  default = 6
}

variable "ingress_direction"{
  default = "INGRESS"
}

variable "ingress_sg_type"{
  default = "NETWORK_SECURITY_GROUP"
}
variable "ssh_public_key"{
  default = "/Users/hager/Desktop/udemy/key.pub"
}
variable "shape"{
  default = "10Mbps"
}
variable "lb_ip_mode"{
  default = "IPV4"
}
variable "is_private"{
  default = "false"
}
variable "lb1_display_name"{
  default = "load_balancer_A"
}
variable "lb2_display_name"{
  default = "load_balancer_B"
}
variable "listener_name"{
  default = "lb_listener"
}
variable "http_port"{
  default = 80
}
variable "listener_protocol"{
  default = "HTTP"
}
variable "https_port"{
  default = 443
}
variable "backend_set_name"{
  default = "lb_backend"
}
variable "backend_set_policy"{
  default = "LEAST_CONNECTIONS"
}
variable "backend_set_health_checker_url_path"{
  default = "/"
}
variable "autonomous_database_db_name"{
  default = "AppDB"
}
variable "autonomous_database_admin_password"{
  default = "Orcale?12345"
}
variable "display_name"{
  default = "AppDB"
}
variable "autonomous_database_is_free_tier"{
  default = "true"
}
variable "autonomous_database_cpu_core_count"{
  default = "1"
}
variable "autonomous_database_data_storage_size_in_tbs"{
  default = "1"
}
variable "autonomous_database_private_endpoint_label"{
  default = "Orcaledb1"
}
variable "autonomous_database_db_version"{
  default = "19c"
}
variable "subnet_dns_label"{
  default = "privatesubnet"
}
