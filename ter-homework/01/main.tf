terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.12.0" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host = "$YC_VM"
}

#однострочный комментарий

resource "random_password" "pass_root" {
  length      = 8
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "pass_user" {
  length      = 8
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = false
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql-task12"

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.pass_root.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.pass_user.result}",
    "MYSQL_ROOT_HOST=%"
  ]

  ports {
    internal = 3306
    external = 3306
    ip = "127.0.0.1"
  }
}