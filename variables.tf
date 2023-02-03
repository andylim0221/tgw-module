variable "shared_account_id" {
  type        = string
  description = "account ID to deploy to"
}

variable "ram_principals" {
  type        = list(string)
  description = "List of account ID which you wants to share TGW to"
  default     = ["1234567890"]
}

variable "tgw_name" {
  type        = string
  description = "Name for Transit Gateway."
}

variable "tgw_description" {
  type        = string
  description = "Description for Transit Gateway"
}

variable "vpn_attachment" {
  type        = string
  description = "VPC attachment for "
}


variable "tgw_id" {
  type        = string
  description = "Used for TGW attachments"
}

variable "tgw_attachments" {
  type = map(object({
    subnet_ids   = list(string)
    vpc_id       = string
    dns_support  = optional(bool, true)
    ipv6_support = optional(bool, false)
  }))
}