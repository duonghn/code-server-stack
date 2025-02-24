#!/bin/bash

generate_password() {
    openssl rand -base64 12
}

case $1 in
    "start")
        NEW_PASSWORD=$(generate_password)
        sed -i '' "s/CODE_SERVER_PASSWORD=.*/CODE_SERVER_PASSWORD=$NEW_PASSWORD/" .env
        docker compose up -d
        echo "Session started with password: $NEW_PASSWORD"
        ;;
    "stop")
        docker compose down
        docker system prune -f
        docker volume rm code-server-stack_code-server_config
        echo "Session stopped and cleaned"
        ;;
    *)
        echo "Usage: ./session.sh [start|stop]"
        ;;
esac