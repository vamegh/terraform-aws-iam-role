variable "name" {
  type    = string
  default = ""
}

variable "enabled" {
  type    = bool
  default = true
}

variable "policy_inline" {
  type    = string
  default = ""
}

variable "policy_file" {
  type    = list(string)
  default = []
}

variable "policy_managed" {
  type    = list(string)
  default = []
}

variable "max_session_duration" {
  type    = string
  default = "3600"
}

variable "path" {
  type    = string
  default = "/"
}

variable "allow_service" {
  type    = string
  default = ""
}

variable "allow_arn" {
  type    = list(string)
  default = []
}

variable "assume_role" {
  type    = list(string)
  default = []
}

variable "s3_read" {
  type    = list(string)
  default = []
}

variable "s3_write" {
  type    = list(string)
  default = []
}

variable "dynamodb_tables" {
  type    = list(string)
  default = []
}

variable "external_id" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
