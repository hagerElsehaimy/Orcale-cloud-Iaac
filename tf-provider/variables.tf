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
  default = "me-jeddah-1"
}
variable "private_key_path"{
    default = "/Users/hager/.oci/oci.pem"
}
variable "instance_shape"{
    default = "VM.Standard.E2.1.Micro"
}
variable "instance_display_name"{
  default = "webserver A"
}
variable "instance_fault_domain"{
  default = "FAULT-DOMAIN-1"
}
variable "web_image_id"{
  default = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa5nbzzqouuczihfspsj4a23asfocaut4yucp7bvipqrt7vah6ylbq"
}
variable "preserve_boot_volume"{
  default = "false"
}
variable "custom_bootstrap_file_name"{
  default = "/Users/hager/Downloads/install_apache.sh"
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
  default = "/Users/hager/Downloads/public.key.pub"
}