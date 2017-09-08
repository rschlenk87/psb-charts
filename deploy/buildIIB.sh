#!/bin/bash

. '/opt/ibm/iib-10.0.0.9/server/bin/mqsiprofile'
mqsipackagebar -a iibAppJenkinsLocal.bar -w /tmp/git/refarch-integration-esb/integration -k RESTAPI
