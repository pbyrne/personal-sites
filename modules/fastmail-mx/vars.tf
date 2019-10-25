variable "apex" {
  default     = "example.com"
  description = "Parent domain of the MX records"
}

variable "spf" {
  default     = "v=spf1 include:spf.messagingengine.com -all"
  description = "SPF entry to write"
}

variable "primary" {
  default     = "in1-smtp.messagingengine.com"
  description = "Primary email server to specify"
}

variable "secondary" {
  default     = "in2-smtp.messagingengine.com"
  description = "Secondary email server to specify"
}

