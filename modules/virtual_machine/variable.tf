variable "location" {
  type        = string
  default     = "Canada Central"
  description = "Location where resources would be created"
}

variable "resource_group_name" {
  type        = list(string)
  description = "resource group name"
}

variable "name"{
  type = list(string)
  description = "name"
}

variable "address_space"{
  type = list(string)
  description = "IP address space for vnet"
}

variable "address_prefix"{
  type = list(string)
  description = "prefix for subnet"
}
