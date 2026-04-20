# Ответы на домашнее задание к занятию «Управляющие конструкции в коде Terraform»

Финальный код проекта в ветке [**terraform-03**](https://github.com/armskm/netology/tree/terraform-03/ter-homework/03/src)

## Задание 1

<img width="914" height="541" alt="ter-03-01" src="https://github.com/user-attachments/assets/58bde487-a50a-4129-842e-40aedbb14db3" />

## Задание 2

[count-vm.tf](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/count-vm.tf)

[for_each-vm.tf](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/for_each-vm.tf)

## Задание 3

[disk_vm.tf](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/disk_vm.tf)

## Задание 4

<img width="642" height="287" alt="ter-03-4" src="https://github.com/user-attachments/assets/dbbd5d4c-72df-4ef9-a532-74cbce8e8487" />.


В коммит попало только три файла, остальное попало в ветку terraform-03 из main (поздно увидел в задании 4 пункт про ветку))

[Ссылка на коммит](https://github.com/armskm/netology/commit/1cefa018b9fc8ad8a5eb509375f09d5e7c32abec)

## Задание 5

<img width="491" height="363" alt="ter-03-5" src="https://github.com/user-attachments/assets/372440b2-c13d-4c21-973f-f0e6b8189fbf" />

## Задание 6

Код в ветке terraform-03

Решение в исправленных файлах [**ansible.tf**](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/ansible.tf), [**hosts.tftpl**](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/hosts.tftpl), [**test.yml**](https://github.com/armskm/netology/blob/terraform-03/ter-homework/03/src/test.yml)

## Задание 8

Идентифицируйте и устраните намеренно допущенную в tpl-шаблоне ошибку. Обратите внимание, что terraform сам сообщит на какой строке и в какой позиции ошибка!
```
[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"] platform_id=${i["platform_id "]}}
%{~ endfor ~}
```

Не нужен пробел после platform_id и фигурная скобка стоит не в том месте. Вот исправленный код:
```
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"]} platform_id=${i["platform_id"]}
```

## Задание 9

Напишите  terraform выражения, которые сформируют списки:
1. ["rc01","rc02","rc03","rc04",rc05","rc06",rc07","rc08","rc09","rc10....."rc99"] те список от "rc01" до "rc99"
2. ["rc01","rc02","rc03","rc04",rc05","rc06","rc11","rc12","rc13","rc14",rc15","rc16","rc19"....."rc96"] те список от "rc01" до "rc96", пропуская все номера, заканчивающиеся на "0","7", "8", "9", за исключением "rc19"

1. [for i in range(1, 100) : format("rc%02d", i)]
2. 
```
[
  for i in range(1, 97) : 
  format("rc%02d", i)
  if i % 10 != 0 && i % 10 != 7 && i % 10 != 8 && i % 10 != 9 || i == 19
]
```
