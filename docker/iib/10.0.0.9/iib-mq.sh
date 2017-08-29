#!/bin/bash
# -*- mode: sh -*-
# © Copyright IBM Corporation 2015, 2017
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#IIBMQ This is based on the MQ Docker script mq.sh
#IIBMQ It has been chnged to run on an IIB Container

export MQ_QMGR_NAME=$1

set -e
#IIBMQ No need to check the license again
#mq-license-check.sh
echo "----------------------------------------"
source mq-parameter-check.sh
echo "----------------------------------------"
setup-var-mqm.sh
echo "----------------------------------------"
which strmqweb && source setup-mqm-web.sh
echo "----------------------------------------"
mq-pre-create-setup.sh
echo "----------------------------------------"
source mq-create-qmgr.sh
echo "----------------------------------------"
source mq-start-qmgr.sh
echo "----------------------------------------"
source mq-configure-qmgr.sh
echo "----------------------------------------"
source mq-dev-config.sh
echo "----------------------------------------"
#IIBMQ Using IIB monitoring script
#exec mq-monitor-qmgr.sh ${MQ_QMGR_NAME}
