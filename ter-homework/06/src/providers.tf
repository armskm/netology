terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.12.0"

  backend "s3" {
    
    shared_credentials_files = ["~/.aws/credentials"]
    profile                  = "default"
    region                   = "ru-central1"

    bucket  = "tf-state-bucket-klim" # FIO-netology-tfstate
    key     = "terraform.tfstate"
    encrypt = false

    # НОВОЕ: Встроенный механизм блокировок (Terraform >= 1.6)
    # Не требует отдельной базы данных (DynamoDB/YDB)!
    use_lockfile = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
  }

}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}