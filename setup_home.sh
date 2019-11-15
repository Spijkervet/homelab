#!/bin/bash
set -o allexport; source .env; set +o allexport

docker network create traefik
docker network create db

docker-compose -f nginx/docker-compose.yml up -d
# docker-compose -f traefik/docker-compose.yml up -d
docker-compose -f soulseek/docker-compose.yml up -d 
docker-compose -f gitea/docker-compose.yml up -d
docker-compose -f redis/docker-compose.yml up -d
docker-compose -f postgres/docker-compose.yml up -d 
# docker-compose -f odoo/docker-compose.yml up -d 
docker-compose -f watchtower/docker-compose.yml up -d 
docker-compose -f media/docker-compose.yml up -d 
# docker-compose -f sharelatex/docker-compose.yml up -d

cd nextcloud && docker-compose up -d && cd ../

# Install full tex-live environment
# docker exec sharelatex tlmgr install scheme-full
# docker exec sharelatex apt-get update && apt-get install texlive-full -y
