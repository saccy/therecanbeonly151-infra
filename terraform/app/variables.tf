variable "app" {
  description = "App platform variables"
  type    = map(string)
  default = {
    name           = "therecanbeonly151"
    env            = "node-js"
    instance_count = "1"
    size           = "basic-xxs"
    region         = "sgp1"
    repo           = "saccy/therecanbeonly151"
    branch         = "main"
  }
}

# variable "domain" {}
# variable "location" {}
# variable "build_number" {}
