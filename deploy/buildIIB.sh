#!/usr/bin/env sh

cd /opt/ibm/iib-10.0.0.9/server/bin
. ./mqsiprofile
mqsipackagebar -a iibApp.bar -w integration -k RESTAPI
scp iibApp.bar callumj@9.19.34.117:/storage/CASE/refarch-privatecloud
expect "Password: "
send $1"\r"