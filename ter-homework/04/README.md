# Ответы на домашнее задание к занятию «Продвинутые методы работы с Terraform»

## Задание 1

<img width="613" height="70" alt="ter-04-1" src="https://github.com/user-attachments/assets/6b66e77c-5bdf-4571-a11c-344546df628c" />
.

<img width="1590" height="154" alt="ter-04-11" src="https://github.com/user-attachments/assets/93d17f93-6341-44f9-ae5d-97b0ddadbae7" />
.

<img width="745" height="1309" alt="ter-04-111" src="https://github.com/user-attachments/assets/ebd421ad-2714-4ebb-89b4-4b7588c8ac43" />

## Задание 2

Ссылка на модуль - https://github.com/armskm/netology/tree/terraform-04/ter-homework/04/src/vpc

3. Пришлите скриншот информации из terraform console о своем модуле.

<img width="604" height="722" alt="ter-04-23" src="https://github.com/user-attachments/assets/39b81544-83d5-465a-a7a3-e895133653b4" />
.

5. [Readme with terraform docs](https://github.com/armskm/netology/blob/terraform-04/ter-homework/04/src/vpc/README.md)

## Задание 3

Список выполненных команд:
```
terraform state list
terraform state rm module.vpc_dev_a
terraform state rm module.vpc_dev_b
terraform state list
terraform console
terraform state rm module.marketing_vm
terraform state rm module.analytics_vm
terraform state list
terraform import module.vpc_dev_a.yandex_vpc_network.netmod enpj41u5hfndjkeb52ii
terraform import module.vpc_dev_b.yandex_vpc_network.netmod enpnrsc7fv86qgdbp832
terraform import module.vpc_dev_a.yandex_vpc_subnet.submod e9bgrg643e0le19vi206
terraform import module.vpc_dev_b.yandex_vpc_subnet.submod e2l3c5uktq65k6artcg3
terraform import module.analytics_vm.yandex_compute_instance.vm[0] epd7r1uupqdcq25ae58a
terraform import module.marketing_vm.yandex_compute_instance.vm[0] fhmree7almmujm4fvmdr
terraform import module.analytics_vm.data.yandex_compute_image.my_image epd636ju3ndr1ep9hkpu
terraform state list
terraform plan
```

Скрины выполнения:

<img width="820" height="345" alt="ter-04-31" src="https://github.com/user-attachments/assets/d1a003c6-a6bf-4d85-b10c-3ea0086d478e" />

<img width="1194" height="1264" alt="ter-04-32" src="https://github.com/user-attachments/assets/3ee0ae52-4e10-45cf-a4c3-49cf2f5f18f2" />

<img width="1307" height="646" alt="ter-04-33" src="https://github.com/user-attachments/assets/a32afee4-b57d-4b3c-85f5-2a6dd5793012" />

<img width="1363" height="1026" alt="ter-04-34" src="https://github.com/user-attachments/assets/e49aa71a-d119-4521-a2b1-a83beb61397c" />



