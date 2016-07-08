# Confluent-On-Cloudera

Fast Data applications require a distributed messaging system like `Apache Kafka`. The [Confluent Platform](http://www.confluent.io/product) provides excellent tools for building stream processing applications.

If you already run a Big Data platform (based on Cloudera), you can use **Confluent-On-Cloudera** to make easier the installation, configuration and monitoring of your infrastructure.

> Gives you a 10,000 feet view of your entire Big Data and Fast data infrastructure 

### Features

* Confluent Platform Installation automation
* Start and stop services from CM ( with auditing )
* Manage deployments ( scale up and down )
* Monitoring / Health checks
* Reporting and performance metrics
* Easy Access to log files

## Preview

<img src="https://raw.githubusercontent.com/Landoop/Confluent-On-Cloudera/gh-pages/ConfluentOnCloudera.gif">

## Quick Install

To install the Confluent-On-Cloudera CSD copy the 45KByte file into location `/opt/cloudera/csd/` at the server with Cloudera Manager,
set the ownership and restart the service:

```bash
$ sudo mkdir -p /opt/cloudera/csd
$ sudo wget "https://archive.landoop.com/cdh5/csd/Confluent-Platform-2.0.1-0.jar" -O /opt/cloudera/csd/Confluent-Platform-2.0.1-0.jar
$ sudo chown -R cloudera-scm:cloudera-scm /opt/cloudera/csd
$ sudo systemctl restart cloudera-scm-server
```

Using **Cloudera Manager** you can proceed with deployment and installation. [Learn more information here]()

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/confluent.png" width="260"/></a>
</p>

Log-in and click on the top-right actions icon and `Add a Service`:

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/AddCustomServiceDescriptor.png" width="400"/></a>
</p>

Select the new option `Confluent Platform` and continue:

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/SelectConfluentPlatform.png" width="700"/></a>
</p>

In the following image you need to select the `hosts` where each of the service will be installed:

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/SelectRolesAndHosts.png" width="700"/></a>
</p>

And then we go through a configuration/settings page where we can review the port numbers and other setting related to our
new services

Success :-) we have the `Confluent Platform 2.0.1` managed through Cloudera Manager

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/success.png" width="400"/></a>
</p>

---


---
## Support




<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/AllConfluentServices.png" width="300"/></a>
</p>

JXM is used for health-checks and a rich set of metrics are collected from the brokers.
Logs are also available through Cloudera Manager

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/ConfluentLogs.png" width="700"/></a>
</p>

## Cluster isolation

When installing the `Confluent Platform CSD` on a Cloudera managed Cluster - we avoid stepping on existing
ports used by Cloudera's Kafka servers and zookeepers.

This CSD allows us to deploy in an isolated way Confluent Platform - and enables i.e. teams to maintain a set of 3 Cloudera Kafka servers - and 7 Confluent Kafka servers as two separate messaging systems.
In effect this allows scaling / removing or running in parallel and even testing enabling kerberorization in Kafka.

# Pre-requisites

The CSD requires the Confluent Platform to be already installed in the cluster in the recommended locations:

`/opt/confluent-2.0.1/`

# Port mappings

To avoid overlapping with Cloudera's default ports the Confluent Platform uses the following ports:

|       Service        | Port              |
| :------------------: | -----------------:|
| Zookeeper            |             2181  |
| Kafka Server         |             9092  |
| Schema Registry      |             8081  |
| Kafka-Rest proxy     |             8082  |
| Kafka Connect        |             8083  |

## TODO

* Add more configuration settings and options to roles
* Fetch `parcels` to avoid manual installation
* Support rolling restarts
* Use logback instead of log4j
* Test test test

## DISCLAIMER

This CSD in _not yet_ a Cloudera Certified CSD.

We will be applying for the `Cloudera Manager CSDs` Certification, but for now consider this as _experimental_

[Apache-License](LICENSE.txt)
