. .env


sudo mkdir -p /docker/nextcloud/redis
sudo mkdir -p /docker/postgresql
sudo mkdir -p /docker/odoo/addons
docker network create traefik

docker-compose -f traefik/docker-compose.yml \
    -f postgres/docker-compose.yml \
    -f odoo/docker-compose.yml \
    up -d

cd nextcloud && docker-compose up -d && cd ../

# docker stack deploy --compose-file traefik/docker-compose.yml \
#     -c postgres/docker-compose.yml \
#     -c nextcloud/docker-compose.yml \
#     -c odoo/docker-compose.yml \
#     home
