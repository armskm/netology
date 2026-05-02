resource "yandex_mdb_mysql_cluster" "my_cluster" {
  name        = var.mysql_cl[0].name
  environment = var.mysql_cl[0].environment
  network_id  = yandex_vpc_network.develop.id
  version     = var.mysql_cl[0].version

  resources {
    resource_preset_id = var.mysql_cl[0].preset
    disk_type_id       = var.mysql_cl[0].disk_type
    disk_size          = var.mysql_cl[0].disk_size
  }

  host {
    zone      = var.default_zone
    subnet_id = yandex_vpc_subnet.develop.id
  }
}

resource "yandex_mdb_mysql_database" "my_db" {
  cluster_id = yandex_mdb_mysql_cluster.my_cluster.id
  name       = var.name_db
}

resource "yandex_mdb_mysql_user" "my_user" {
  cluster_id = yandex_mdb_mysql_cluster.my_cluster.id
  name       = var.user_db
  password   = var.user_pass

  permission {
    database_name = yandex_mdb_mysql_database.my_db.name
    roles         = ["ALL"]
  }
}

