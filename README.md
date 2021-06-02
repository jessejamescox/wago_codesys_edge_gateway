
# Running Codesys Edge Gateway on WAGO ARM platform
  
## Prerequisites  
* WAGO PFC200 G2, Edge Controller, or WAGO TP600 with Docker Engine installed 
* The Docker Engine ipk (version 20.10 or later) can be found [here](https://github.com/WAGO/docker-ipk ).
  
## Running Codesys Edge Gateway in a Docker Container  
The following steps show how to build the Docker image from the Dockerfile.
   
### Step 1. Build the Codesys Edge Gateway Docker Image on the WAGO PFC200 G2, Edge Controller, or TP600     
**1.1** Download and decompress the `wago_codesys_edge_gateway` package.  It is advised that you configure the Docker engine to mount to the SD card.  In a terminal run:
```  
cd /media/docker 
wget https://github.com/jessejamescox/wago_codesys_edge_gateway/archive/refs/heads/main.zip && unzip https://github.com/jessejamescox/wago_codesys_edge_gateway/archive/refs/heads/main.zip.zip && rm https://github.com/jessejamescox/wago_codesys_edge_gateway/archive/refs/heads/main.zip
```  
  
**1.2** Next, build the Docker image: 
```  
cd /media/docker/wago_wago_codesys_edge_gateway-main
docker build -t wago_codesys_edge_gateway . 
```
### Step 2. Running the Codesys Edge Gateway container
**2.0** To run this container:
```  
docker run -d -p 1217:1217 --restart=unless-stopped wago_codesys_edge_gateway
```
### This is currently beta
Please provide feedback on this as you come accross it. If you wish to contribute please contact me directly.
