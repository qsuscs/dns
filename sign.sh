#!/bin/sh
die() {
	echo "$1"
	exit 1
}
[ -z "$1" ] && die "no zone specified"
[ -e "$1" ] || die "Zone file $1 does not exist"
if [ -e "$1.K" ]; then
	. "./$1.K"
else
	die "Key file $1.K does not exist"
fi
[ -z "$ZSK" ] && die "ZSK undefined"
[ -z "$KSK" ] && die "KSK undefined"
exec ldns-signzone "$1" "$ZSK" "$KSK"
