setlocal
FOR /F "tokens=*" %%i in ('type .env') do SET %%i

docker.exe network create traefik
docker-compose.exe -f traefik/docker-compose.yml up -d
docker-compose.exe -f postgres/docker-compose.yml up -d 
docker-compose.exe -f odoo/docker-compose.yml up -d 
docker-compose.exe -f watchtower/docker-compose.yml up -d 
docker-compose.exe -f media/docker-compose.yml up -d 
cd nextcloud && docker-compose.exe up -d && cd ../
