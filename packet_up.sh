#!/bin/bash

PROJECT_ID=$1
NODE_TEMPLATE=$2
NODES=$3

if [ $# -lt 2 ]; then
    echo "$0: usage: <PROJECT_ID> <NODE_TEMPLATE> [NODES]"
    exit 1
fi


if [ -z "PROJECT_ID" ]; then
    echo "argument error: Please set PROJECT_ID"
    echo "$0: usage: packet_up <PROJECT_ID> [NODES]"
fi

if [ -z "NODES" ]; then
    COUNT=1
else
	COUNT=$NODES
fi


PROJECT_ID=98d4a96a-7bad-4ecd-aac9-111823a6cce6


for i in `seq 1 $COUNT`; do
	echo creating node $NODE_TEMPLATE-$i
	#docker-machine create --driver packet --packet-api-key "${API_KEY:?Need to set API_KEY}" --packet-project-id $PROJECT_ID $NODE_TEMPLATE-$i
done
