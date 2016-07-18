#!/bin/bash

function quit()
{
  exit 1
}

(

   flock -n 9 || quit

/home/bandersnatch/bin/bandersnatch mirror

) 9>/var/lock/bandersnatch
