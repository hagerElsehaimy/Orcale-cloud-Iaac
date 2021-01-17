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
  default = "webserver1"
}
variable "instance_fault_domain"{
  default = "FAULT-DOMAIN-1"
}
variable "web_image_id"{
  default = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa5nbzzqouuczihfspsj4a23asfocaut4yucp7bvipqrt7vah6ylbq"
}
variable "preserve_boot_volume"{
  default = "true"
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
variable "egress_destination"{
  default = "0.0.0.0/0"
}
variable "egress_destination_type"{
  default = "CIDR_BLOCK"
}
variable "egress_direction"{
  default = "EGRESS"
}
variable "egress_protocol"{
  default = "all"
}