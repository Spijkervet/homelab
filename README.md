####################
# General settings #
####################

# Directoy on the host where all the data will be stored. It will be automatically created if it doesn't exist.
DATA_DIR=/nextcloud

# Hostname at which the Nextcloud instance will be accessible.
HOST=

# Version of MySQL and Nextcloud to use
MYSQL_VERSION=8.0
NEXTCLOUD_VERSION=15.0

#############################################################################
#                       Backups                                             #
#############################################################################

# Backblaze B2 bucket to which the data will be backed up. You need to create it yourself.
B2_BUCKET=nextcloud-backup

# Backblaze B2 credentials
B2_ID=
B2_KEY=

# Backup schedule (UTC timezone)
BACKUP_SCHEDULE=0 2 * * *

# Encryption key to use before backing up the data. Must be at least 8 characters.
BACKUP_ENCRYPTION_KEY=!

# Name of the backup
BACKUP_NAME=nextcloud-backup

