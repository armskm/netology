output "vm_list" {
  value = concat(
    [
      for vm in yandex_compute_instance.web : {
        name = vm.name
        fqdn = vm.fqdn
        id   = vm.id
      }
    ],
    [
      for vm in values(yandex_compute_instance.db) : {
        name = vm.name
        fqdn = vm.fqdn
        id   = vm.id
      }
    ]
  )
}