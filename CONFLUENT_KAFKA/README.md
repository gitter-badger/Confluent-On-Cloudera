service.sdl -> user `confluent` instead of kafka ?

## Ports

zookeeper_port: 22181
kafka_port: 29092
schema_registry_port: 28081
kafka_rest_port: 28082
kafka_connect_port: 28083

### 
JMX Port : 29394
Http metric report Port: 24043 ( instead of 24042 ) 

## CSS custimisations

vim /usr/share/cmf/webapp/static/cms/css/cms.css

INSERT

.label-service-confluentkafka{background-color:#FF8400;color:#333}

##

// vim /opt/confluent-2.0.1/bin/kafka-run-class
// GC_FILE_SUFFIX='.log'
  
//vim /opt/confluent-2.0.1/bin/kafka-server-start
//EXTRA_ARGS="-name server -loggc"
  
