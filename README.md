# CSDs for Cloudera Manager 

A collection of Custom Service Descriptors

__Build requires:__  Maven 3

```bash
$ mvn install
```

CSDs are small jars generated under the /target/ folder of each module

## Install

To install the generated CSDs copy them over into `/opt/cloudera/csd/` at the server with Cloudera Manager,
set the ownership and restart the service:

```bash
chown cloudera-scm.cloudera-scm /opt/cloudera/csd/*
service cloudera-scm-server restart
```

Stay happy knowing that this is a quick and easy operation that usually requires 3 to 4 seconds.
We are not stopping anything on cluster or monitoring, just reloading a web app here. 

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

The main new capabilities are:

* Start and stop services from CM ( with auditing )
* Manage deployments ( scale up and down )
* Monitoring / Health checks
* Reporting and performance metrics 
* Easy Access to log files

---

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

|       Service        | Confluent Platform |   JMX    | Http metric port |
| :------------------: | ------------------:| --------:| ----------------:|
| Zookeeper            |             22181  |     9011 |                  |
| Kafka Server         |             29092  |    29394 |            24043 | 
| Schema Registry      |             28081  |    24044 |                  |
| Kafka-Rest port      |             28082  |    24045 |                  |
| Kafka Connect        |             28083  |          |                  |

*_JMX + Http metric ports are the same as Cloudera's but bumped +1 or the next available_

## TODO

* Add more configuration settings and options to roles
* Fetch `parcels` to avoid manual installation
* Test test test

## DISCLAIMER

This CSD in _not yet_ a Cloudera Certified CSD.

We will be applying for the `Cloudera Manager CSDs` Certification, but for now consider this as _experimental_

[Apache-License](LICENSE.txt)
