data "aws_caller_identity" "current" {}

module "tgw" {
  count                                 = data.aws_caller_identity.current.account_id == var.shared_account_id ? 1 : 0
  source                                = "terraform-aws-modules/transit-gateway/aws"
  version                               = "~> 2.0"
  name                                  = "my-tgw"
  description                           = "My TGW shared with several other AWS accounts"
  vpc_attachments                       = var.vpc_attachments
  share_tgw                             = true
  enable_auto_accept_shared_attachments = true
  ram_allow_external_principals         = true
  ram_principals                        = var.ram_principals
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each           = data.aws_caller_identity.current.account_id == var.shared_account_id ? {} : var.vpc_attachments
  subnet_ids         = each.value.subnet_ids
  transit_gateway_id = var.tgw_id
  vpc_id             = each.value.vpc_id
}
