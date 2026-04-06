#!/bin/bash
echo "Остановка всех сервисов..."
docker compose -f monitoring/docker-compose.yaml down
docker compose -f mtproto-proxy/docker-compose.yaml down
docker compose -f mail/docker-compose.yaml down
docker compose -f matrix/docker-compose.yaml down
docker compose -f reverse-proxy/docker-compose.yaml down
docker compose -f infrastructure.yaml down

echo "Очистка неиспользуемых сетей Docker..."
docker network prune -f

echo "Запуск всех сервисов..."
docker compose -f infrastructure.yaml up -d --remove-orphans
docker compose -f monitoring/docker-compose.yaml up -d --force-recreate
docker compose -f mtproto-proxy/docker-compose.yaml up -d --force-recreate
docker compose -f mail/docker-compose.yaml up -d --force-recreate
docker compose -f matrix/docker-compose.yaml up -d --force-recreate
docker compose -f reverse-proxy/docker-compose.yaml up -d --force-recreate