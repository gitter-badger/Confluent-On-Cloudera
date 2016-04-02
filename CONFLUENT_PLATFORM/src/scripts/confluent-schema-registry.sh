#!/usr/bin/env bash

CONFLUENT_HOME=/opt/confluent-2.0.1

# For debugging
echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "CONFLUENT HOME: $CONFLUENT_HOME"
echo "CONF_DIR: $CONF_DIR"
echo "JMX_PORT: $JMX_PORT"
echo "ENABLE_MONITORING: ${ENABLE_MONITORING}"
echo "METRIC_REPORTERS: ${METRIC_REPORTERS}"

export LOG_DIR=/var/log/confluent/schema-registry
mkdir -p $LOG_DIR

export JMX_PORT=24044

export SCHEMA_REGISTRY_LOG4J_OPTS="-Dlog4j.configuration=file://$CONF_DIR/log4j.properties"

# Run [ schema-registry ]
exec $CONFLUENT_HOME/bin/schema-registry-start $CONFLUENT_HOME/etc/schema-registry/schema-registry.properties