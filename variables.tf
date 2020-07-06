variable "aws" {
  description = "(Required) AWS Credentials"
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })

  default = {
    region     = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}

variable "dns" {
  description = "(Required) FQDN for your website"
  type = object({
    name              = string
    zone              = string
  })

  default = {
    name              = ""
    zone              = ""
  }
}

variable "cors_allowed_headers" {
  type        = list(string)
  default     = ["*"]
  description = "List of allowed headers"
}

variable "cors_allowed_methods" {
  type        = list(string)
  default     = ["GET"]
  description = "List of allowed methods (e.g. GET, PUT, POST, DELETE, HEAD) "
}

variable "cors_allowed_origins" {
  type        = list(string)
  default     = ["*"]
  description = "List of allowed origins (e.g. example.com, test.com)"
}

variable "cors_expose_headers" {
  type        = list(string)
  default     = ["ETag"]
  description = "List of expose header in the response"
}

variable "cors_max_age_seconds" {
  type        = number
  default     = 3600
  description = "Time in seconds that browser can cache the response"
}