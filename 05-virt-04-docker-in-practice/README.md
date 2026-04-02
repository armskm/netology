# Ответы на домашнее задание к занятию 5. «Практическое применение Docker»
## Задача 2
[Отчет сканирования на уязвимости образа с python приложением из задания №1](https://github.com/user-attachments/files/26389712/vulnerabilities.csv)

## Задача 3

![task3](https://github.com/user-attachments/assets/53bdbc30-9862-434e-a432-7e76e3121fb6)

## Задача 4

Форк: https://github.com/armskm/shvirtd-example-python

![task4](https://github.com/user-attachments/assets/8f421acc-ab88-4085-8a98-79d1ab8333e8)

## Задача 5

Скрипт бэкапа:

```
#!/bin/bash

CARRENT_TIME=$(date +%Y%m%d.%H.%M.%S)
source /root/netology/task5/shvirtd-example-python/.env
docker run \
    --env-file /root/netology/task5/shvirtd-example-python/.env \
    --rm --entrypoint "" \
    -v /opt/backup:/backup \
    --network shvirtd-example-python_backend \
    schnitzler/mysqldump \
    mysqldump --opt -h db -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "--result-file=/backup/dumps_${CARRENT_TIME}.sql" $MYSQL_DATABASE
```

cron-task:

```*/1 * * * * /bin/bash /root/netology/task5/shvirtd-example-python/backup.sh```

![z5](https://github.com/user-attachments/assets/777ae6eb-3d1d-4d3a-a3a3-d6b82a6d1707)

## Задача 6

![z5 6](https://github.com/user-attachments/assets/b0271a6d-8dd9-4f10-8824-c1b0c5d1d3c6)

### Задача 6.1

![z5 6 1](https://github.com/user-attachments/assets/d54c14b6-c45d-4d73-8b57-006387afb76d)

### Задача 6.2

Решение взято отсюда: https://docs.docker.com/build/building/export/

![z5 6 2](https://github.com/user-attachments/assets/36f2c383-d2f9-44f0-927d-dea27d5abd6e)
