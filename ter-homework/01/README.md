# Ответы на домашнее задание к занятию «Введение в Terraform»

![ter-version](https://github.com/user-attachments/assets/13be69e0-6dcc-4f3b-b44d-cc895d9710b1)


## Задача 1

2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд):

   **В файле  personal.auto.tfvars**

3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

   **"result": "tTgnxIM48uVVJi62"**

4. Ошибки в файле main.cf:
   - У ресурса "docker_image" не указан name "nginx"
   - У ресурса "docker_container" неверный синтаксис в имени. Вначале не должно быть цифры
   - Ошибки в строке **name  = "example_${random_password.random_string_FAKE.resulT}"**. Большая T в result - ошибка в имени атрибута. random_string_FAKE - несуществующее имя ресурса.

5. Исправленный код:
   ```
   resource "docker_image" "nginx" {
     name         = "nginx:latest"
     keep_locally = true
   }

   resource "docker_container" "nginx" {
     image = docker_image.nginx.image_id
     name  = "example_${random_password.random_string.result}"

     ports {
       internal = 80
       external = 9090
     }
   }
   ```
   
   ![ter-01-1-5](https://github.com/user-attachments/assets/804da0e6-1de9-4318-bd4e-91fa1704315e)


6. Команда terraform apply -auto-approve опасна тем, что при автоподтверждении мы теряем возможность изучить ещё раз все изменения, применяемые при деплое main.tf. Вероятность применения кода с ошибками на потенциальный прод увеличивается. Но флаг полезен при автоматизации.

   ![ter-01-1-6](https://github.com/user-attachments/assets/1aa6da86-9726-4798-9c80-65c4af78b381)

7. Содержимое файла terraform.tfstate:

   ![ter-01-1-7](https://github.com/user-attachments/assets/08275795-4ce9-4e59-8a04-73a226444f16)

9. Образ не удалился, потому что в main.tf в описании ресурса "docker_image" указано **keep_locally = true**. В документации указано:
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

## Задача 2

[**Финальный код main.tf**](https://github.com/armskm/netology/blob/main/ter-homework/01/main.tf)

## Задача 3

![ter-01-3-tofu](https://github.com/user-attachments/assets/2bcfeb16-382a-4efa-a7e6-59e19ab87015)

