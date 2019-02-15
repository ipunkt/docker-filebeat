#!/bin/bash

set -x

URL="${HOSTURL:-http://localhost:9200}"
ENVIRONMENT=${ENVIRONMENT:-Rancher}
USERNAME="${USERNAME:-USER}"
PASSWORD="${PASSWORD:-PASSW}"

if [ ! -z "${URL}" ] ; then
	OLD_IFS="${IFS}"
	IFS=","

	HOSTURL=""
	for HOST in ${URL} ; do
		HOSTURL="${HOSTURL}\"${HOST}\","
	done
	HOSTURL="${HOSTURL:0:-1}"

	IFS="${OLD_IFS}"
fi

sed \
	-e "s~##HOSTURL##~${HOSTURL}~" \
	-e "s~##ENVIRONMENT##~${ENVIRONMENT}~" \
	-e "s~##USERNAME##~${USERNAME}~" \
	-e "s~##PASSWORD##~${PASSWORD}~" \
	/var/filebeat.yml > /usr/share/filebeat/filebeat.yml


/usr/local/bin/docker-entrypoint $*
