FROM nextcloud:apache
RUN apt-get update && apt-get install -y smbclient && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y aria2 cifs-utils youtube-dl

COPY fstab /etc/fstab
COPY smbcredentials /root/.smbcredentials
