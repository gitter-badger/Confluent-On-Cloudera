#!/bin/bash

# for debugging
set -x

CONFLUENT_ZOOKEEPER_HOME=/opt/confluent-2.0.1
CONF_DIR=/opt/confluent-2.0.1/etc/kafka

# For better debugging
echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "CONF_DIR: $CONF_DIR"
echo "KAFKA_HOME: $KAFKA_HOME"
echo "Zoookeper Quorum: $ZK_QUORUM"
echo "Chroot: $CHROOT"
echo "JMX_PORT: $JMX_PORT"
echo "ENABLE_MONITORING: ${ENABLE_MONITORING}"
echo "METRIC_REPORTERS: ${METRIC_REPORTERS}"
echo "BROKER_HEAP_SIZE: ${BROKER_HEAP_SIZE}"

# # Generating Zookeeper quorum
# QUORUM=$ZK_QUORUM
# if [[ -n $CHROOT ]]; then
#     QUORUM="${QUORUM}${CHROOT}"
# fi
# echo "Final Zookeeper Quorum is $QUORUM"

# if ! grep zookeeper.connect= ${CONF_DIR}/kafka.properties; then
#     echo "zookeeper.connect=$QUORUM" >> ${CONF_DIR}/kafka.properties
# fi

# Add monitoring parameters - note that if any of the jars in kafka.metrics.reporters is missing, Kafka will fail to start
#if [[ ${ENABLE_MONITORING} == "true" ]]; then
#    echo "kafka.metrics.reporters=${METRIC_REPORTERS}" >>  $CONF_DIR/kafka.properties
#fi


# Propoagating logger information to Kafka
#export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$CONF_DIR/log4j.properties"

# Set LOG_DIR to pwd as this directory exists and hence the underlaying run-kafka-class.sh won't try to create a new directory inside the parcel
#export LOG_DIR=`pwd`

# Set heap size
#export KAFKA_HEAP_OPTS="-Xmx${BROKER_HEAP_SIZE}M"
#export KAFKA_HEAP_OPTS="-Xmx1G"
# Antwnis - documentation
# mkdir -p /var/log/confluent/kafka/
# chown -R confluent.confluent /var/log/confluent

# Set java opts
#export KAFKA_JVM_PERFORMANCE_OPTS="${BROKER_JAVA_OPTS}"

# And finally run Kafka itself
#exec $KAFKA_HOME/bin/kafka-server-start $CONF_DIR/server.properties