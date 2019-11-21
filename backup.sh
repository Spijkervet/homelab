source .env

mkdir -p ~/backups
tar -zcvf ~/backups/cloud.tar.gz ${CLOUD_DIR}
rsync -avxH -e 'ssh -p 2222' --progress ~/backups/cloud.tar.gz hf_backup_001@backup.hollandfoodz.com:/media/HF_BACKUP_001/jspijkervet >> backup.log
# tar -zcvf ~/backups/docker.tar.gz ${DATA_DIR}
