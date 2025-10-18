#!/bin/bash
# toolkit/backup/backup_postgres.sh
# Backup diário do banco PostgreSQL em container Docker

set -e

CONTAINER_NAME="postgres"
BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
FILE="$BACKUP_DIR/pg_backup_$DATE.sql.gz"

mkdir -p $BACKUP_DIR

docker exec $CONTAINER_NAME pg_dumpall -U postgres | gzip > $FILE

echo "✅ Backup completo: $FILE"
