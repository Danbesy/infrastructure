#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

set -e

cd "$(dirname "$0")"

echo -e "${GREEN}Checking for configuration templates...${NC}"
echo -e "${GREEN}Создание конфигурационных файлов из шаблонов...${NC}"
find . -name "*.example" | while read -r template; do
    target="${template%.example}"
    
    if [ ! -f "$target" ]; then
        echo "Creating $target from template..."
        echo "Создание $target из шаблона..."
        cp "$template" "$target"
    else
        echo "Skipping $target (already exists)"
        echo "Пропуск $target (уже существует)"
    fi
done

echo -e "${GREEN}Stopping all services...${NC}"
echo -e "${GREEN}Остановка всех сервисов...${NC}"
docker compose -f monitoring/docker-compose.yaml down
docker compose -f mtproto-proxy/docker-compose.yaml down
docker compose -f mail/docker-compose.yaml down
docker compose -f matrix/docker-compose.yaml down
docker compose -f reverse-proxy/website/docker-compose.yaml down
docker compose -f reverse-proxy/docker-compose.yaml down

echo -e "${GREEN}Stopping network orchestration...${NC}"
echo -e "${GREEN}Остановка сетевой оркестрации...${NC}"
docker compose -f infrastructure.yaml down
sleep 3

echo -e "${GREEN}Clean up unused Docker networks...${NC}"
echo -e "${GREEN}Очистка неиспользуемых Docker сетей...${NC}"
docker network prune -f
sleep 3

echo -e "${GREEN}Provisioning network orchestration...${NC}"
echo -e "${GREEN}Подготовка сетевой оркестрации...${NC}"
docker compose -f infrastructure.yaml up -d --remove-orphans
sleep 3

echo -e "${GREEN}Starting all services...${NC}"
echo -e "${GREEN}Запуск всех сервисов...${NC}"
docker compose -f monitoring/docker-compose.yaml up -d --force-recreate
docker compose -f mtproto-proxy/docker-compose.yaml up -d --force-recreate
docker compose -f mail/docker-compose.yaml up -d --force-recreate
docker compose -f matrix/docker-compose.yaml up -d --force-recreate
docker compose -f reverse-proxy/website/docker-compose.yaml up -d --force-recreate
docker compose -f reverse-proxy/docker-compose.yaml up -d --force-recreate

echo -e "${GREEN}All services started successfully!${NC}"
echo -e "${GREEN}Все сервисы успешно запущены!${NC}"