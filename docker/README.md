# Build docker image for IIB

The project includes two directories under docker folder:
* mq - provides a Dockerfile for building an MQ image suitable for IIB internal usage.
* iib - provides a Dockerfile for building an IIB image using the above mq image as a base.

This instructions were created by using a base Ubuntu 14.04, with docker already installed.

## Creating the MQ base and IIB docker images
We assume this project was clone via git clone or the script [clonePeers.sh](https://github.com/ibm-cloud-architecture/refarch-integration/blob/master/clonePeers.sh)

1. Run Docker build command to create the docker image named **mqbase** using the local dockerfile definition:
 ```
 docker build -t mqbase refarch-integration-esb/docker/mq/.
 ```

1. Run the Docker build command to create the **iib10009** docker image locally:
 ```
 docker build -t iib10009 refarch-integration-esb/docker/iib/10.0.0.9
 ```

