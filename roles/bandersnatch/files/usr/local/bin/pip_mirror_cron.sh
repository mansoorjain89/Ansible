#!/bin/bash

FILE_NAME="/var/log/bandersnatch/pip_mirror_cron_job-$(date +%Y-%m-%d-%M).log"

function quit()
{
    echo "Exiting! Since another update process is currently running" > $FILE_NAME 2>&1
    exit 1
}

(

   flock -n 9 || quit
   /opt/bandersnatch/bin/bandersnatch mirror > $FILE_NAME 2>&1

) 9>/var/lock/bandersnatch.lck
