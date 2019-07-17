# Homelab 
This is a repository containing my Homelab stack built on Docker. All services live behind a Traefik reverse proxy.
It also allows the option to automatically backup to Backblaze.


## Installation
Simply run `./setup_home.sh` to start all microservices on the main server. `./setup_raspberry.sh` is used for microservices on the Raspberry Pi.

Add an .env file with the following contents in the `nextcloud` folder:
```
####################
# General settings #
####################

# Directoy on the host where all the data will be stored. It will be automatically created if it doesn't exist.
DATA_DIR=/docker
MEDIA_DIR=/media/media_001
PUID=$(id -u)
PGID=$(id -g)

PLEX_CLAIM_TOKEN=""

# Hostname at which the Nextcloud instance will be accessible.
HOSTNAME=
HOST_IP=

# Version of Nextcloud to use
NEXTCLOUD_VERSION=16.0

TZ="Europe/Amsterdam"


#############################################################################
#                       Backups                                             #
# See https://github.com/christophetd/duplicacy-autobackup for more details #
#############################################################################

# Backblaze B2 bucket to which the data will be backed up. You need to create it yourself.
B2_BUCKET=home-nextcloud-backup

# Backblaze B2 credentials
B2_ID=
B2_KEY=

# Backup schedule (UTC timezone)
BACKUP_SCHEDULE='0 2 * * *'

# Encryption key to use before backing up the data. Must be at least 8 characters.
BACKUP_ENCRYPTION_KEY=

# Name of the backup
BACKUP_NAME=nextcloud-backups
```

