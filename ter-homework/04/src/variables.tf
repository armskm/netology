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

variable "develop_a_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "develop_b_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "develop_a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "develop_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "develop_a" {
  type        = string
  default     = "develop-ru-central1-a"
}

variable "develop_b" {
  type        = string
  default     = "develop-ru-central1-b"
}

variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMIsIQmdqEbYmORtzxErWWcyvPsXTPpIKR4FAMdymIrG root@deb12"
}


###vm vars

variable "vm_web_os" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "marketing" {
  type        = string
  default     = "marketing"
}

variable "analytics" {
  type        = string
  default     = "analytics"
}

variable "marketing_env" {
  type        = string
  default     = "develop"
}

variable "analytics_env" {
  type        = string
  default     = "stage"
}