###compute vars
###vm_web

variable "vm_web_os" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v1"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  default     = 1
}

variable "vm_web_core_fr" {
  type        = number
  default     = 5
}

###vm_db

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v1"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  default     = 2
}

variable "vm_db_core_fr" {
  type        = number
  default     = 20
}

## var for locals

variable "edu" {
  type        = string
  default     = "netology"
}

variable "dev" {
  type        = string
  default     = "develop-platform"
}

variable "s1" {
  type        = string
  default     = "web"
}

variable "s2" {
  type        = string
  default     = "db"
}