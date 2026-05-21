resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "debian" {
  family = var.vm_web_os
}

#создаем 3 ВМ
resource "yandex_compute_instance" "vm" {
    for_each = { for vm in var.each_vm : vm.vm_name => vm }
  
  name        = each.value.vm_name
  hostname    = each.value.vm_name
  platform_id = var.vm_web_platform

  resources {
    cores         = var.vm_par[0].cores
    memory        = var.vm_par[0].memory
    core_fraction = var.vm_par[0].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.debian.image_id
    }
  }

  metadata = {
    ssh-keys = "debian:${local.public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_nat
  }
}