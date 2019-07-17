set -o allexport; source .env; set +o allexport

sudo mkdir -p /docker/nextcloud/redis
sudo mkdir -p /docker/postgresql
sudo mkdir -p /docker/odoo/addons
sudo mkdir -p /docker/organizr/config

sudo mkdir -p /docker/media/shared/movies
sudo mkdir -p /docker/media/shared/tv

docker network create traefik

docker-compose -f traefik/docker-compose.yml \
    -f postgres/docker-compose.yml \
    -f odoo/docker-compose.yml \
    -f watchtower/docker-compose.yml \
    -f media/docker-compose.yml \
    up -d

cd nextcloud && docker-compose up -d && cd ../

sudo chown -R $USER:docker /docker/media

# docker stack deploy --compose-file traefik/docker-compose.yml \
#     -c postgres/docker-compose.yml \
#     -c nextcloud/docker-compose.yml \
#     -c odoo/docker-compose.yml \
#     home
