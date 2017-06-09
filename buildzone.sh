#!/bin/sh
ZONE="${1%.tmpl}"
DIR="$(dirname "${0}")"
m4 -DSERIAL="$(date +%s)" "${1}" > "${ZONE}"
if test -e "${ZONE}.K"
then
	"${DIR}/sign.sh" "${ZONE}"
	mv "${ZONE}.signed" "${ZONE}"
fi
