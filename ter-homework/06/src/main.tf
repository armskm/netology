resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_os
}

#создаем web ВМ
resource "yandex_compute_instance" "web" {
  #depends_on = [yandex_compute_instance.db]

  count = 1

  name        = "${var.vm_web[0].name}-${count.index + 1}"
  hostname    = "${var.vm_web[0].name}-${count.index + 1}"
  platform_id = var.vm_web_platform

  resources {
    cores         = var.vm_web[0].cores
    memory        = var.vm_web[0].memory
    core_fraction = var.vm_web[0].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = var.vm_preemptible }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}