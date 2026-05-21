output "all_vm" {

  value = [
    { clickhouse = ["external_ip = ${yandex_compute_instance.vm["clickhouse"].network_interface[0].nat_ip_address}", "internal_ip = ${yandex_compute_instance.vm["clickhouse"].network_interface[0].ip_address}"] },
    { vector = ["external_ip = ${yandex_compute_instance.vm["vector"].network_interface[0].nat_ip_address}", "internal_ip = ${yandex_compute_instance.vm["vector"].network_interface[0].ip_address}"] },
    { lighthouse = ["external_ip = ${yandex_compute_instance.vm["lighthouse"].network_interface[0].nat_ip_address}", "internal_ip = ${yandex_compute_instance.vm["lighthouse"].network_interface[0].ip_address}"] }
  ]
}