# 1. Создаем сервисный аккаунт
resource "yandex_iam_service_account" "tf_state_sa" {
  name        = var.sa_name
  description = "Service Account for managing TF state in Object Storage"
}

# 2. Назначаем роль storage.editor сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa_editor" {
  folder_id = var.folder_id # Укажите ваш folder_id
  role      = var.sa_role
  member    = "serviceAccount:${yandex_iam_service_account.tf_state_sa.id}"
}

# 3. Создаем статические ключи доступа для сервисного аккаунта
resource "yandex_iam_service_account_static_access_key" "sa_static_key" {
  service_account_id = yandex_iam_service_account.tf_state_sa.id
  description        = "Static access key for object storage"
}

# 4. Создаем бакет с включенным версионированием
resource "yandex_storage_bucket" "tf_state_bucket" {
  bucket     = var.tf_state_bucket
  access_key = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
  acl        = "private"
}