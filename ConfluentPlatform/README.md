# UI 

CSS custimisations

    vim /usr/share/cmf/webapp/static/cms/css/cms.css

INSERT

    .label-service-confluentkafka{background-color:#FF8400;color:#333}

# Development environment

On local machine:

    git clone https://github.com/Landoop/CSDS.git
    mvn install
    scp ConfluentPlatform/target/Confluent-Platform-2.0.1.jar landoop@cloudera.landoop.com:

On cloudera.landoop.com

    Stop + Remove from CM the `Confluent Platform` service

    rm -rf /opt/cloudera/csd/Confluent-Platform-2.0.1.jar
    mv ~landoop/Confluent-Platform-2.0.1.jar /opt/cloudera/csd/
    chown cloudera-scm.cloudera-scm /opt/cloudera/csd/*
    service cloudera-scm-server restart

    Add Service `Confluent Platform` in CM

# Notes

/opt/confluent-2.0.1/etc/kafka/server.properties

    kafka.http.metrics.host=0.0.0.0
    kafka.http.metrics.port=24043
    kafka.log4j.dir=/var/log/confluent/kafka