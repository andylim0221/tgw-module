output "tgw_id" {
  value = one(module.tgw[*].ec2_transit_gateway_id)
}