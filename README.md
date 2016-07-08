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

## Support

* Confluent Platform 2.0.1
* Cloudera Manager > 5.4

Contact us at [Landoop]() for support   

## Quick Install

It looks like this: Log-in to Cloudera Manager and click on the top-right actions icon and `Add a Service`:

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/AddCustomServiceDescriptor.png" width="400"/></a>
</p>

Select the new option `Confluent Platform` and continue:

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/SelectConfluentPlatform.png" width="700"/></a>
</p>

Then select the `hosts` where each of the service will be installed, and go through a configuration/settings page where we can review the port numbers and other setting related to our new services

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/success.png" width="400"/></a>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/gh-pages/imgs/AllConfluentServices.png" width="300"/></a>
</p>

Success :-) we have the `Confluent Platform 2.0.1` managed through Cloudera Manager

> [Access the entire Confluent-On-Cloudera documentation here](https://docs.landoop.com/pages/confluent-csd/install.html)

# Ports

To avoid overlapping with Cloudera's default ports the Confluent Platform uses the following ports:

|       Service        | Port              |
| :------------------: | -----------------:|
| Kafka Server         |             9092  |
| Schema Registry      |             8081  |
| Kafka-Rest proxy     |             8082  |
| Kafka Connect        |             8085  |
| Zookeeper            |             2181 ¹|

¹ Zookeeper is chrooted at `2181/confluent` 

