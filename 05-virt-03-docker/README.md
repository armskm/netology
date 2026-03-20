# Ответы на домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»
## Задача 1
Ссылка на registry: https://hub.docker.com/r/armskm/custom-nginx

## Задача 2
![z2](https://github.com/user-attachments/assets/2fb39f90-488e-4921-8785-cbc7b198067a)

## Задача 3
Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
Выполните docker ps -a и объясните своими словами почему контейнер остановился.

Ответ: Потому что при нажатии Ctrl-C из стандартного потока ввода/вывода/ошибок мы останавливаем Nginx. Из-за этого останавливается контейнер.


![z3 1](https://github.com/user-attachments/assets/a39d6e58-44e8-4cca-bf43-bbe5746f640d)

![z3 2](https://github.com/user-attachments/assets/9c71e1c7-a739-4a49-9c2e-45cd97bf0773)

Проверьте вывод команд: ss -tlpn | grep 127.0.0.1:8080 , docker port custom-nginx-t2, curl http://127.0.0.1:8080. Кратко объясните суть возникшей проблемы.

Ответ: Потому что nginx в контейнере работает теперь на порту 81, а мапинг сделан на 80 порт.

![z3 3](https://github.com/user-attachments/assets/f617550c-671a-44f6-878d-b17b0b755f37)

## Задача 4

![z4](https://github.com/user-attachments/assets/159fb5af-25ed-4026-a32b-0efe3e235ada)

## Задача 5

1. И выполните команду "docker compose up -d". Какой из файлов был запущен и почему?

   Ответ: Был запущен compose.yaml, т.к. Compose отдает предпочтение каноническому файлу compose.yaml

![z5 1](https://github.com/user-attachments/assets/d5d7a3ed-5b6c-4abe-8fc9-9ce74dfcb7d9)

![z5 2](https://github.com/user-attachments/assets/0b1fa4f9-f15a-477b-85b2-5bd3571f74c5)

![z5](https://github.com/user-attachments/assets/a07f376a-c11c-48b8-95bf-134fdf5bb851)
