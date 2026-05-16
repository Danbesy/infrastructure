## 📂 Структура проекта (RU)
> **Персональная модульная серверная инфраструктура на базе Docker.**
```text
.
├── ansible               # Глобальная автоматизация развёртывания
├── caddy                 # Облачное хранилище (Caddy)
├── docs                  # Документация (EN/RU)
├── mail                  # Почтовый сервер (Stalwart)
├── matrix                # Федерация Matrix (Dendrite & PostgreSQL)
├── monitoring            # Стек мониторинга (Grafana, Prometheus, Node-Exporter, Cadvisor)
├── mtproto-proxy         # Прокси для Telegram (MTProto)
├── reverse-proxy         # Шлюз Nginx (Docker и системные сервисы)
│   ├── conf.d            # Хранилище основных конфигов Nginx (Grafana, Website, и т.д.)
│   ├── snippets          # Модульные конфиги Nginx (SSL, Cloudflare, Matrix)
│   ├── certs             # Хранилище SSL сертификатов
│   └── website           # Развертывание вебсайта (React, Next.js, Tailwind CSS)
├── infrastructure.yaml   # Файл сетевой оркестрации
└── scripts               # Хранилище скриптов
    └── start.sh          # Скрипт для запуска/перезагрузки инфраструктуры

```
*💡 Примечание: Ansible выполняет полный деплой и доставку конфигураций на сервер, в то время как скрипт ./scripts/start.sh используется исключительно для подготовки сети, первого запуска и последующей перезагрузки сервисов (без изменения их конфигов).*

## 🛠 Технологический стек
  - Оркестрация: Docker & Docker Compose
  - Входной шлюз (Ingress): Nginx
  - Автоматизация деплоя: Ansible
  - Сервисы:
    * Cloud Storage: Caddy
    * Mail: Stalwart
    * Matrix: Dendrite, PostgreSQL
    * Monitoring: Grafana, Prometheus, Node-Exporter
    * Telegram MTProto Proxy
    * Website: React 19, Next.js 15, Tailwind CSS

## 🚀 Быстрый старт
1.  **Клонируйте репозиторий:**
    ```bash
    git clone https://github.com/Danbesy/infrastructure.git
    cd infrastructure
    ```
2.  **Деплой конфигурации:**
    Подготовьте инвентарь и переменные окружения в group_vars/all, после чего запустите Ansible для инициализации  сервера и генерации конфигов:
    ```bash
    cd ansible && ansible-playbook -i environments/development/inventory.ini playbook.yaml
    ```
    *(При первом запуске на «голый» сервер добавьте флаги `-k -K` для авторизации по паролю).*
3.  **Запуск и перезагрузка:**
    Используйте оркестрационный скрипт для автоматической подготовки сетей и последовательного поднятия всех Docker-сервисов:
    ```bash
    chmod +x scripts/start.sh && ./scripts/start.sh
    ```

## 🔒 Безопасность
  - **Read-Only Mounts:** Все сниппеты Nginx монтируются в режиме `:ro` для защиты от изменений.
  - **Маскировка IP:** Интегрирован `cloudflare.conf` для восстановления реальных IP посетителей.
  - **Управление секретами:** Чувствительные данные строго отделены от кода через `.env` файлы и Ansible Vault.

## 🛠 Обслуживание
  - **Просмотр логов:** `docker compose logs -f`
  - **Запуск сервиса:** `docker compose up -d`
  - **Остановка сервиса:** `docker compose down`