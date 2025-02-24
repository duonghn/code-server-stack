#!/bin/bash

generate_password() {
    openssl rand -base64 12
}

is_session_running() {
    docker compose ps --quiet code-server 2>/dev/null
}

case $1 in
    "start")
        if [ "$(is_session_running)" ]; then
            echo "Session is already running. Please stop it first using: ./session.sh stop"
            exit 1
        fi

        NEW_PASSWORD=$(generate_password)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/CODE_SERVER_PASSWORD=.*/CODE_SERVER_PASSWORD=$NEW_PASSWORD/" .env
        else
            sed -i "s/CODE_SERVER_PASSWORD=.*/CODE_SERVER_PASSWORD=$NEW_PASSWORD/" .env
        fi
        
        docker compose up -d
        echo "Session started with password: $NEW_PASSWORD"
        ;;
    "stop")
        if [ ! "$(is_session_running)" ]; then
            echo "No session running."
            exit 0
        fi
        docker compose down
        #docker system prune -f
        #docker volume rm code-server-stack_code-server_config
        echo "Session stopped and cleaned"
        ;;
    *)
        echo "Usage: ./session.sh [start|stop]"
        ;;
esac