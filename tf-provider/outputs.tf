output "vcn_id"{
    value = module.vcn.vcn_id
    description = "vcn id"
}
output "vcn_ig_rt"{
    value = module.vcn.ig_route_id
    description = "internet gateway route table id"
}
output "vcn_ig"{
    value = module.vcn.internet_gateway_id
    description = "internet gateway id"
}
output "vcn_nat"{
    value = module.vcn.nat_gateway_id
    description = "nat gateway id"
}
output "vcn_nat_rt"{
    value = module.vcn.nat_route_id
    description = "nat gateway route table id"
}
