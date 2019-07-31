#!/bin/bash
set -o allexport; source .env; set +o allexport
docker network create traefik

docker-compose -f traefik/docker-compose.yml up -d
docker-compose -f postgres/docker-compose.yml up -d 
docker-compose -f odoo/docker-compose.yml up -d 
docker-compose -f watchtower/docker-compose.yml up -d 
docker-compose -f media/docker-compose.yml up -d 


cd nextcloud && docker-compose up -d && cd ../

# sudo chown -R $PUID:$PGID /docker/media

# docker stack deploy --compose-file traefik/docker-compose.yml \
#     -c postgres/docker-compose.yml \
#     -c nextcloud/docker-compose.yml \
#     -c odoo/docker-compose.yml \
#     home
