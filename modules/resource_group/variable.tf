variable "instances" {
  description = "Map of resource group instances to create"
  type = map(object({
    name     = string
    location = string
  }))
  default = {
  }
}
