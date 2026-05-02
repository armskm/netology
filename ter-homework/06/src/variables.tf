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

###security_group vars

variable "security_group_ingress" {
  description = "secrules ingress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "разрешить входящий ssh"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий  http"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий https"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}


variable "security_group_egress" {
  description = "secrules egress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    { 
      protocol       = "TCP"
      description    = "разрешить весь исходящий трафик"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65365
    }
  ]
}

###vm vars

variable "vm_web_os" {
  type        = string
  default     = "ubuntu-2004-lts"
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

variable "vm_web" {
  type = list(object({
    name     = string
    cores    = number
    memory   = number
    core_fr  = number
  }))
  default = [
    {
      name    = "web"
      cores   = 2
      memory  = 1
      core_fr = 5
    }
  ]
}

locals {
  public_key = file("/root/.ssh/id_rsa.pub")
}

variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIsIQmdqEbYmORtzxErWWcyvPsXTPpIKR4FAMdymIrG root@deb12"
}


###vars for mysql

variable "mysql_cl" {
  type = list(object({
    name           = string
    environment    = string
    version        = string
    preset         = string
    disk_type      = string
    disk_size      = number
  }))
  default = [
    {
      name          = "clusterdb"
      environment   = "PRESTABLE"
      version       = "8.0"
      preset        = "b2.medium"
      disk_type     = "network-hdd"
      disk_size     = 10
    }
  ]
}

variable "name_db" {
  type        = string
}

variable "user_db" {
  type        = string
}

variable "user_pass" {
  type        = string
}

###vars for registry

variable "registry_name" {
  type        = string
  default     = "my-registry"
}