# Итоговый проект модуля «Облачная инфраструктура. Terraform»

Цель итогового проекта:
развернуть web-приложение для работы в облачной инфраструктуре Yandex Cloud.

## 📁 Структура проекта
```
├── src/ # Основные конфигурационные файлы Terraform
│ ├── main.tf # Создание VPC, сети, подсети и ВМ
│ ├── mysql.tf # Создание кластера MySQL
│ ├── providers.tf # Настройка провайдера Yandex и удалённого состояния (бекенд S3)
│ ├── security.tf # Правила группы безопасности (доступ по SSH, HTTP, HTTPS)
│ ├── variables.tf # Определение всех входных переменных
│ ├── cloud-init.yml # Cloud‑init для VM: установка Docker, конфигурация окружения
│ ├── .gitignore
│ └── registry.tf # Создание registry yandex
├── app/ # Папка с приложением и Docker-конфигурацией
│ ├── Dockerfile # Многостадийная сборка FastAPI‑приложения
│ ├── compose.yaml # Описание сервисов (Docker Compose)
│ ├── proxy.yaml # Конфигурация прокси-серверов
│ ├── main.py # Исходный код веб-приложения
│ ├── requirements.txt # Зависимости Python
│ ├── README.md # Подробное описание работы приложения
│ └── ... # Вспомогательные файлы
└── README.md # Текущий файл
```

---

## 💡 Как работает

1. **Terraform** из [src](https://github.com/armskm/netology/tree/main/ter-homework/06/src) разворачивает:
   - Сеть `develop` и подсеть `10.0.1.0/24`;
   - Кластер MySQL (Managed Service) с именем `clusterdb`, базой данных и пользователем;
   - Группу безопасности: входящий SSH (22), HTTP (80), HTTPS (443), весь исходящий трафик;
   - Виртуальную машину (VM) `web-1` на Ubuntu с публичным IP.
   - Yandex container registry

     При этом файл providers.tf использует S3-бекенд Yandex Cloud (Object Storage) для хранения состояния удалённо, с поддержкой блокировок через use_lockfile = true

2. **Cloud‑init** на VM (файл [cloud-init.yml](https://github.com/armskm/netology/blob/main/ter-homework/06/src/cloud-init.yml)) автоматически:
   - Устанавливает Docker и Docker Compose на vm
   - Создаёт файл `.env` с переменными подключения к БД (хост, пользователь, пароль, имя БД), которые Terraform динамически подставляет из созданного кластера MySQL и кладёт на VM

3. Ручной этап. **На VM** с настроенной yc утилитой:
   - Для получения id registry:
     yc container registry list
   - Делаем build образа из [Dockerfile](https://github.com/armskm/netology/blob/main/ter-homework/06/app/Dockerfile)
     docker build -t cr.yandex/<reg_id>/my-app:1.0.0
   - Пушим образ в созданный terraform-ом registry
     docker push cr.yandex/<reg_id>/my-app:1.0.0
     
4. Ручной этап. **На VM web-1, созданной terraform**:
   - В [compose.yaml](https://github.com/armskm/netology/blob/main/ter-homework/06/app/compose.yaml) меняем путь до образа на cr.yandex/<reg_id>/my-app:1.0.0, созданный в пункте 4.
   - С помощью `docker compose` из [app](https://github.com/armskm/netology/tree/main/ter-homework/06/app) поднимается веб-приложение, которое обращается к созданному кластеру MySQL через переменные из `.env`.

---


## 🚀 Результат работы

<img width="1379" height="136" alt="ter-06-1" src="https://github.com/user-attachments/assets/bd00c4a5-8010-4553-8643-af89d4992d92" />
.
<img width="435" height="163" alt="ter-06-2" src="https://github.com/user-attachments/assets/96f1daa9-3fcf-4bd2-980e-35af8f141a51" />


