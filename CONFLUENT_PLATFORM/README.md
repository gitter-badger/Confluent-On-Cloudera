A CSD ( Cloudera Service Descriptor ) for our favorite platform `Confluent Platform 2.0.1`

When installing the `Confluent Platform` on a Cloudera managed Cluster - we avoid stepping on existing
ports used by Cloudera's Kafka servers and zookeepers. 

This CSD allows us to deploy in an isolated way Confluent Platform - and enables i.e. teams to maintain a set of 3 Cloudera Kafka servers - and 7 Confluent Kafka servers as two separate messaging systems.
In effect this allows scaling / removing or running in parallel and even testing enabling kerberorization in Kafka.

# Port mappings

To avoid overlapping with Cloudera's default ports the Confluent Platform uses the following ports:

|       Service        | Confluent Platform |   JMX    | Http metric port |
| :------------------: | ------------------:| --------:| ----------------:|
| Zookeeper            |             22181  |          |                  |
| Kafka Server         |             29092  |    29394 |            24043 | 
| Schema Registry      |             28081  |          |                  |
| Kafka-Rest port      |             28082  |          |                  |
| Kafka Connect        |             28083  |          |                  |

*_JMX + Http metric ports are the same as Cloudera's but bumped +1_

# UI 

CSS custimisations

    vim /usr/share/cmf/webapp/static/cms/css/cms.css

INSERT

    .label-service-confluentkafka{background-color:#FF8400;color:#333}

# Development environment

On local machine:

    git clone https://github.com/Landoop/CSDS.git
    mvn install
    scp CONFLUENT_PLATFORM/target/Confluent-Platform-2.0.1.jar landoop@cloudera.landoop.com:

On cloudera.landoop.com

    Stop + Remove from CM the `Confluent Platform` service

    rm -rf /opt/cloudera/csd/Confluent-Platform-2.0.1.jar
    mv ~landoop/Confluent-Platform-2.0.1.jar /opt/cloudera/csd/
    chown cloudera-scm.cloudera-scm /opt/cloudera/csd/*
    service cloudera-scm-server restart

    Add Service `Confluent Platform` in CM
    
    
    
/opt/confluent-2.0.1/etc/kafka/server.properties
    
    kafka.http.metrics.host=0.0.0.0           # This would log into Cloudera?
    kafka.http.metrics.port=24043             # This would log into Cloudera?
    kafka.log4j.dir=/var/log/confluent/kafka  # This would log into Cloudera?