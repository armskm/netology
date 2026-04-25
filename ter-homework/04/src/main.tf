#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = var.develop_a
  zone           = var.develop_a_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.develop_a_cidr
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.develop_b
  zone           = var.develop_b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.develop_b_cidr
}


module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.marketing_env 
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.develop_a_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.marketing
  instance_count = 1
  image_family   = var.vm_web_os
  public_ip      = true

  labels = { 
    project = var.marketing
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.analytics_env
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.develop_b_zone]
  subnet_ids     = [yandex_vpc_subnet.develop_b.id]
  instance_name  = var.analytics
  instance_count = 1
  image_family   = var.vm_web_os
  public_ip      = true

  labels = { 
    project = var.analytics
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = var.public_key
  }
}

