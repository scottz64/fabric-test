#!/bin/bash

#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

CurrentDirectory=$(cd `dirname $0` && pwd)
FabricTestDir="$(echo $CurrentDirectory | awk -F'/fabric-test/' '{print $1}')/fabric-test"
NLDir=$FabricTestDir/tools/NL

CWD=$PWD

cd $NLDir
echo "[$0] NL dir: $PWD"
# bring down network
echo "[$0] bring down network"
./networkLauncher.sh -a down
# bring up network
echo "[$0] bring up network"
./networkLauncher.sh -o 1 -x 1 -r 1 -p 4 -k 4 -e 3 -z 3 -n 1 -t kafka -f test -w localhost -S enabled -c 2s -l INFO -B 500 -d couchdb

cd $CWD
echo [$0] "current dir: $PWD"
