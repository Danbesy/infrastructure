## 📂 Структура проекта (RU)
> **Персональная модульная серверная инфраструктура на базе Docker.**
```text
.
├── mail/                # Почтовый сервер (Stalwart)
├── matrix/              # Федерация Matrix (Dendrite & PostgreSQL)
├── monitoring/          # Стек мониторинга (Grafana, Prometheus, Node-Exporter)
├── mtproto-proxy/       # Прокси для Telegram (MTProto)
├── reverse-proxy/       # Шлюз Nginx (Docker и системные сервисы)
│   ├── snippets/        # Модульные конфиги Nginx (SSL, Cloudflare, Matrix)
│   ├── certs/           # Хранилище SSL сертификатов
│   └── website/         # Развертывание вебсайта (React, Next.js, Tailwind CSS)
├── infrastructure.yaml  # Файл сетевой оркестрации
└── start.sh             # Скрипт глобальной автоматизации деплоя
```
*Примечание: Используйте `./start.sh` для подготовки сети и последовательного развертывания всех сервисов.*

## 🛠 Технологический стек
  - Оркестрация: Docker & Docker Compose
  - Шлюз: Nginx
  - Сервисы:
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
2.  **Настройка:** Подготовьте переменные окружения и SSL сертификаты.
3.  **Запуск:**
    ```bash
    chmod +x start.sh && ./start.sh
    ```

## 🔒 Безопасность
  - **Read-Only Mounts:** Все сниппеты Nginx монтируются в режиме `:ro` для защиты от изменений.
  - **Маскировка IP:** Интегрирован `cloudflare.conf` для восстановления реальных IP посетителей.
  - **Управление секретами:** Чувствительные данные строго отделены от кода через `.env` файлы.

## 🛠 Обслуживание
  - **Просмотр логов:** `docker compose logs -f`
  - **Запуск сервиса:** `docker compose up -d`
  - **Остановка сервиса:** `docker compose down`