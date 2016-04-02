# CSDs for Cloudera Manager 

A collection of Custom Service Descriptors.

## Requirements

 * Maven 3 (to build)

## Building the CSDs

```bash
$ mvn install
```

The CSDs are generated under the /target/ folder of each module

## Installing CSDs

To install the generated CSDs copy them over into `/opt/cloudera/csd/` at the server with Cloudera Manager,
set the ownership and restart the service:

```bash
chown cloudera-scm.cloudera-scm /opt/cloudera/csd/*
service cloudera-scm-server restart
```

Stay happy knowing that this is a quick and easy operation that usually required 2-3 seconds.
We are not stopping anything on cluster or monitoring, just reloading a web app here.

<p align="center">
  <img src="https://raw.githubusercontent.com/Landoop/CSD/master/images/AddCustomServiceDescriptor.png" width="300"/></a>
</p>




[Apache-Licensed](LICENSE.txt).

