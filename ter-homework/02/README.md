# Ответы на домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Задание 1
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
   - Platform "standart-v4" not found - опечатка в standart. Нужно standard. Так же нет платформы standard-v4. Поставил v1.
   - the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4 - ну тут ограничение платформы v1. Нельзя поставить один проц. Поставил 2.
5. Скрин ip ВМ в личном кабинете YC и непосредственно из ВМ:

   ![ter-02-1-5](https://github.com/user-attachments/assets/33c49db6-e374-43a0-a8f0-0e1f261b6390)

7. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.
   - preemptible - прерываемая, core_fraction - Гарантированная доля vCPU - эти параметры уменьшают стоимость ВМ. Полезно при обучении. Экономят баланс личного кабинета))

## Задание 4

Вывод terraform output

![ter-02-4](https://github.com/user-attachments/assets/543ede6f-caec-4945-9f4a-290b40737108)

## Задание 5

[**locals.tf**](https://github.com/armskm/netology/blob/main/ter-homework/02/src/locals.tf)

## Задание 6

[**vms_platform.tf**](https://github.com/armskm/netology/blob/main/ter-homework/02/src/vms_platform.tf)

[**main.tf**](https://github.com/armskm/netology/blob/main/ter-homework/02/src/main.tf)


## Задание 7

```
terraform console
> local.test_list[1]
"staging"
> local.test_list[2]
"production"
> length(local.test_list)
3
> local.test_map.admin
"John"
> local.test_map["admin"]
"John"
> "${local.test_map["admin"]} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers["production"].image} with ${local.servers["production"].cpu} vcpu, ${local.servers["production"].ram} ram and ${length(local.servers["production"].disks)} virtual disks"
"John is admin for production server based on OS ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks"
```

## Задание 8

Переменная определена в [**variables.tf**](https://github.com/armskm/netology/blob/main/ter-homework/02/src/variables.tf)

```
terraform console
> var.test[0]["dev1"][0]
"ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117"
```
