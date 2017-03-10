#!/bin/bash

if [[ "$AWS_USE_SERVICE_TASK_ROLE" == "true" ]]; then
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
fi

if [[ "$RESTORE" == "true" ]]; then
  ./restore.sh
else
  ./backup.sh
fi

if [ -n "$CRON_TIME" ]; then
  echo "${CRON_TIME} /backup.sh >> /dockup.log 2>&1" > /crontab.conf
  crontab  /crontab.conf
  echo "=> Running dockup backups as a cronjob for ${CRON_TIME}"
  exec cron -f
fi
