#!/bin/bash

function quit()
{
    echo "Exiting! Since another update process is currently running"
    exit 1
}

(

   flock -n 9 || quit
   /opt/bandersnatch/bin/bandersnatch mirror

) 9>/var/lock/bandersnatch
