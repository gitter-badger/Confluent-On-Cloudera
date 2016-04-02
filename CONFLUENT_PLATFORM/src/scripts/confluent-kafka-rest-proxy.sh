#!/usr/bin/env bash

CONFLUENT_HOME=/opt/confluent-2.0.1

# For debugging
echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "CONF_DIR: $CONF_DIR"
echo "CONFLUENT HOME: $CONFLUENT_HOME"
echo "JMX_PORT: $JMX_PORT"
echo "ENABLE_MONITORING: ${ENABLE_MONITORING}"
echo "METRIC_REPORTERS: ${METRIC_REPORTERS}"
echo "BROKER_HEAP_SIZE: ${BROKER_HEAP_SIZE}"

export LOG_DIR=/var/log/confluent/kafka-rest
mkdir -p $LOG_DIR

export JMX_PORT=24045

export KAFKAREST_LOG4J_OPTS="-Dlog4j.configuration=file://$CONF_DIR/log4j.properties"

# Run [ kafka-rest ]
exec $CONFLUENT_HOME/bin/kafka-rest-start $CONFLUENT_HOME/etc/kafka-rest/kafka-rest.properties