#Building the IBM Integration Bus Application

The following documents how to build a deployable BAR file for the Integration 
application, and then upload this to a HTTP server. 

##Prerequisite
As a prerequisite, IBM Integration Bus needs to be installed on the machine. These instructions
are assuming a Linux operating system:  

1. Download the developer edition:    
   wget http://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/integration/10.0.0.9-IIB-LINUX64-DEVELOPER.tar.gz 


1. Install the downloaded file into /opt/ibm:
   mkdir /opt/ibm
   tar -xf 10.0.0.9-IIB-LINUX64-DEVELOPER.tar.gz --exclude iib-10.0.0.9/tools --directory /opt/ibm 
   
1. Review the license agreement and if acceptable accept using the following 
command: 
   /opt/ibm/iib-10.0.0.9/iib make registry global accept license silently
    
##Building the IBM Integration Bus Application
**It is assumed that you have already cloned the git repository to the following location: /iibmqDocker**

1. Run the mqsiprofile command to setup the environment:
   . /opt/ibm/iib-10.0.0.9/server/bin/mqsiprofile

1. Run the following command to generate the BAR file:
   mqsipackagebar -a iibApp.bar -w /iibmqDocker/refarch-integration-esb/integration -k RESTAPI

1. Upload the BAR file to an HTTP Server so it can be available to the docker container during start-up. Use whatever mechanism you like to upload the file to the HTTP server, I used scp:     
   scp iibApp.bar callumj@9.19.34.117:/storage/CASE/refarch-privatecloud   
   

##Creating an instance in IBM Cloud private

1. Log into the IBM Cloud private Web UI, and navigate to the System page, and click **Sync Up Repository**:  

   ![](img/syncRepository.png)
   Confirm the Sync operation.
   
1. Open the **App Center**, and type IIB within the search bar:      

   ![](img/AppCenterIIB.png)

1. Click on the **Install Package**, and customize the locations for your Integration Bar file, and potentially the Docker image. Click **Review and install** to view the final configuration:     

   ![](img/configAppInstall.png)

1. Click **Install** to start the installation process.

1. A success pop-up will appear.

1.  Navigate to the Applications section:      
    ![](img/NavigateToApps.png)

1. Within the search bar enter **iib** and an application should be shown:    
    ![](img/IIBApp.png)    
   At this stage it may show the available as **0** as the containers are still being created.
   
1. Click into the application to view the details:
   ![](img/SummaryOfApplication.png)
   
1. To verify the solution is working by clicking on the **access webui** link. This should load the IIB Web UI within a browser.
