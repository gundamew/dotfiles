#!/usr/bin/env bash

CURDATE=`date +%Y%m%d`
HOSTNAME=`hostname -s`
BACKUP_FILENAME_POSTFIX='mysql-backup.sql'
BACKUP_FILENAME="/${CURDATE}-${HOSTNAME}-${BACKUP_FILENAME_POSTFIX}"
BACKUP_FILEPATH=.

# Use --defaults-extra-file to avoid "using a password on the command line interface can be insecure" warning
mysqldump --defaults-extra-file=mysqldump-credentials.cnf --all-databases > ${BACKUP_FILEPATH}${BACKUP_FILENAME}

# Use Gzip to compress backup file
gzip ${BACKUP_FILEPATH}${BACKUP_FILENAME}

# Remove files created more than 30 days ago
find ${BACKUP_FILEPATH} -name "*${BACKUP_FILENAME_POSTFIX}" -ctime +30d -delete
