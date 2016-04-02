#!/usr/bin/env bash

CONFLUENT_HOME=/opt/confluent-2.0.1

# For debugging
echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "CONFLUENT HOME: $CONFLUENT_HOME"
echo "CONF_DIR: $CONF_DIR"
echo "Zoookeper Quorum: $ZK_QUORUM"
echo "JMX_PORT: $JMX_PORT"
echo "ENABLE_MONITORING: ${ENABLE_MONITORING}"
echo "METRIC_REPORTERS: ${METRIC_REPORTERS}"

export LOG_DIR=/var/log/confluent/zookeeper
mkdir -p $LOG_DIR

export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file://$CONF_DIR/log4j.properties"

export JMX_PORT=9011

# Run [ zookeeper ]
exec $CONFLUENT_HOME/bin/zookeeper-server-start $CONFLUENT_HOME/etc/kafka/zookeeper.properties