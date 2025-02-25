#!/bin/bash

# Отправить это в crontab -e

LIMIT=5

docker rmi -f $(docker images --format "{{ .Repository }} {{.CreatedAt}}" --filter "reference=test*" | sort -r -k2 | tail -n +$(( LIMIT + 1 )) | awk '{ print $1 }' | uniq) 2> /dev/null
