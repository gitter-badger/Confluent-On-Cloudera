#!/usr/bin/env bash -x -e

CONFLUENT_HOME=/opt/confluent-2.0.1

# For better debugging
echo ""
echo "Date: `date`"
echo "Host: `hostname -f`"
echo "Pwd: `pwd`"
echo "CONF_DIR: $CONF_DIR"
echo "CONFLUENT HOME: $CONFLUENT_HOME"
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
if [[ ${ENABLE_MONITORING} == "true" ]]; then
    echo "kafka.metrics.reporters=${METRIC_REPORTERS}" >>  $CONF_DIR/kafka.properties
fi
# Set heap size
#export KAFKA_HEAP_OPTS="-Xmx${BROKER_HEAP_SIZE}M"
export KAFKA_HEAP_OPTS="-Xmx1G"

export LOG_DIR=/var/log/confluent/kafka
mkdir -p $LOG_DIR

# Override with custom formatting rules
# TODO: This should be pushed upstream to Confluent team
# export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$CONF_DIR/log4j.properties"
export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:///opt/log4j_kafka_server.properties"

# Set Kafka jvm opts
export KAFKA_JVM_PERFORMANCE_OPTS="${BROKER_JAVA_OPTS}"

# Run [ kafka-broker ]
exec $CONFLUENT_HOME/bin/kafka-server-start $CONFLUENT_HOME/etc/kafka/server.properties