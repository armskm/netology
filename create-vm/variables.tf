###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###vm vars

variable "vm_web_os" {
  type        = string
  default     = "debian-12"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
}

variable "vm_nat" {
  type        = bool
  default     = true
}

variable "vm_preemptible" {
  type        = bool
  default     = true
}

variable "vm_par" {
  type = list(object({
    cores    = number
    memory   = number
    core_fr  = number
  }))
  default = [
    {
      cores   = 2
      memory  = 1
      core_fr = 5
    }
  ]
}

variable "vm_name" {
  type = list(object({  vm_name=string }))
  default = [
    {
      vm_name     = "clickhouse"
    },
    {
      vm_name     = "vector"
    },
    {
      vm_name     = "lighthouse"
    }
  ]
}

locals {
  public_key = file("/root/.ssh/id_rsa.pub")
}