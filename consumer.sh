#!/bin/sh

topic=$1

if [ -z "$topic" ]; then
    echo "Usage: $0 <topic>"
    exit 1
fi

if [ "$topic" = "list" ]; then
    kubectl exec -it kafka-dual-role-0 -n kafka -- \
        bin/kafka-topics.sh \
        --bootstrap-server kafka-kafka-bootstrap:9092 \
        --list
else
    kubectl exec -it kafka-dual-role-0 -n kafka -- \
        bin/kafka-console-consumer.sh \
        --bootstrap-server kafka-kafka-bootstrap:9092 \
        --topic "$topic" \
        --from-beginning
fi