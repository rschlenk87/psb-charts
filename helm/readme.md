# IBM Integration Bus Helm Chart suitable for IBM Cloud private

## IBM Integration Bus Background

IBM Integration Bus is a market-leading lightweight enterprise integration engine that offers a fast, simple way for systems and applications to communicate with each other. As a result, it can help you achieve business value, reduce IT complexity and save money.
IBM Integration Bus supports a range of integration choices, skills and interfaces to optimize the value of existing technology investments. 

[![Brief introduction to IBM Integration Bus](https://img.youtube.com/vi/qQvT4kJoPTM/0.jpg)](https://www.youtube.com/watch?v=qQvT4kJoPTM)

[View the IBM Integration Bus Dockerfile repository on Github](https://github.com/ot4i/iib-docker)

[Learn more about IBM Integration Bus Docker Tips and Tricks](https://developer.ibm.com/integration/blog/2017/04/04/ibm-integration-bus-docker-tips-tricks/)

[Learn more about IBM Integration Bus and Kubernetes](https://developer.ibm.com/integration/blog/2017/08/21/first-look-using-ibm-integration-bus-kubernetes/)

[Learn more about running IBM Integration Bus in the Bluemix Container Service](https://developer.ibm.com/integration/blog/2016/11/18/run-ibm-integration-bus-in-bluemix-in-3-easy-steps/)

[Learn more about IBM Integration Bus](https://www.ibm.com/support/knowledgecenter/en/SSMKHH_10.0.0/com.ibm.etools.msgbroker.helphome.doc/help_home_msgbroker.htm)

[Learn more about IBM Integration Bus and Docker](https://www.ibm.com/support/knowledgecenter/en/SSMKHH_10.0.0/com.ibm.etools.mft.doc/bz91300_.htm)

## Building and Installing the Helm Chart into an IBM Cloud private environment
The following documents the process to install the provided helm chart into 
an IBM Cloud private environment. It has been built based on the docker image
provided [here](../docker/README.md), and therefore you should have completed 
these steps.

As a pre-req to create a new helm chart, you need to install **helm client 2.4.1**, this can be found [here](https://github.com/kubernetes/helm/releases). The instructions assume this has been installed to /opt/helm/linux-amd64/helm

**It is assumed that you have already cloned the git repository to the following location: /iibmqDocker**

1. Helm provides the ability to valid the helm chart prior to us packaging and deploying to a server. Run the following the command:
   /opt/helm/linux-amd64/helm lint /iibmqDocker/refarch-integration-esb/helm/iib
   '''
      ==> Linting /iibmqDocker/refarch-integration-esb/helm/iib
      [INFO] Chart.yaml: icon is recommended

      1 chart(s) linted, no failures
    '''

1. The Helm chart needs to be packaged for deployment, run the following command: 
   /opt/helm/linux-amd64/helm package /iibmqDocker/refarch-integration-esb/helm/iib

1. This will generate a file in the current directory called **iib-0.1.2.tgz**, this needs to be uploaded to a HTTP server, so it can be referenced by a Helm repository. Use whatever mechanism you like to upload the file to the HTTP server, I used scp:     
   scp iib-0.1.2.tgz callumj@9.19.34.117:/storage/CASE/refarch-privatecloud

1. Now that the helm chart is available on a HTTP server, we need to update the helm repository to be aware of the new helm chart. This is completed by updating the index.yaml associated with the helm repository. The helm client provides a utility to simply this process. The first stage is to download the existing index.yaml:
   wget http://172.16.0.5/storage/CASE/local-charts/index.yaml
   
1. This file will then be updated using the helm command:
   /opt/helm/linux-amd64/helm repo index --merge index.yaml --url http://9.19.34.117/storage/CASE/refarch-privatecloud ./
          
   The command should add the following entry into the index.yaml file:
   '''
   apiVersion: v1
   entries:
     iib:
     - apiVersion: v1
       created: 2017-08-31T06:26:56.056012356-04:00
       description: IBM Integration Bus node with local MQ Queue Manager associated
       digest: bb89fdec4a080c505c6b14760a5983fcfb7315470999fc4799021fbb91611615
       name: iib
       urls:
       - http://9.19.34.117/storage/CASE/refarch-privatecloud/iib-0.1.2.tgz
       version: 0.1.2
   '''

1. The index.yaml file now needs to be uploaded to the Helm repository. Use whatever mechanism you like to upload the file to the Helm repository, I used scp:
   scp index.yaml callumj@172.16.0.5:/storage/CASE/local-charts
   
