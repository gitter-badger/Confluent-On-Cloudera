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

Stay happy knowing that this is a quick and easy operation that usually requires 2 to 3 seconds.
We are not stopping anything on cluster or monitoring, just reloading a web app here. 

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





[Apache-License](LICENSE.txt)

