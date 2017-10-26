#!/bin/sh
set -e
set -x
cd "$(dirname "${0}")"
for i in *.tmpl
do
	"./buildzone.sh" "${i}"
done
nsd-control reload
