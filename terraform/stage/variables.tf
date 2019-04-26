variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "spare-stage"
}

variable "heroku_email" {
  description = "Email address for authorized Heroku user"
  type        = "string"
  default     = ""
}

variable "heroku_api_key" {
  description = "API key for authorized Heroku user"
  type        = "string"
  default     = ""
}
