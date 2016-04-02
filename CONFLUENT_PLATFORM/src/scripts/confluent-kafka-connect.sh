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

# Antwnis - documentation
# mkdir -p /var/log/confluent/kafka/
# chown -R confluent.confluent /var/log/confluent

# Run [ kafka-connect ]
#exec $CONFLUENT_HOME/bin/kafka-server-start $CONFLUENT_HOME/etc/server.properties