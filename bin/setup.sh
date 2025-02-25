# !/bin/bash
COMPOSE_PROJECT_NAME=starter-kit
DOMAIN_ROOT=m-celium

docker network create "$COMPOSE_PROJECT_NAME" 2> /dev/null
docker volume create "$COMPOSE_PROJECT_NAME"_database 2> /dev/null

COMPOSE_PROJECT_NAME="$COMPOSE_PROJECT_NAME" \
APP_HOST="$COMPOSE_PROJECT_NAME"."$DOMAIN_ROOT".localhost \
DB_USER="$COMPOSE_PROJECT_NAME" \
DB_PASS=pass \
NETWORK_NAME="$COMPOSE_PROJECT_NAME" \
docker compose -f docker-compose.db.yaml -f docker-compose.proxy.yaml -f docker-compose.api.yaml up -d --force-recreate
