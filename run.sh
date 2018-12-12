#!/bin/bash

echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''

export host_ip=0.0.0.0

# stop all the running services
echo '==> Stopping any running MedGATE services'
docker-compose -f ./docker/docker-compose.yml stop

echo '==> Configuring enviroment'
# create medgate related directories for initialization 
mkdir -p /medgate/ingress
mkdir -p /medgate/archive
mkdir -p /medgate/hl7

# create gcp related directories for initialization 
mkdir -p /gcp/instances/gcp_1/in
mkdir -p /gcp/applications
mkdir -p /gcp/data
mkdir -p /gcp/output

# create brat data and config directories 
mkdir -p /bratdata
mkdir -p /bratcfg

echo '==> Pulling latest image for MedGATE services'
#remove medgate-service container and pull the latest medgate-service image 
if [ "$(docker ps -aq -f name='medgate-service')" ]; then
    # remove existing medgate-service container
    docker rm -f medgate-service
    # pull the latest medgate-service image
    docker pull swanseauniversitymedical/medgate-dev:latest
fi

echo '==> Building Docker Images'
docker-compose -f ./docker/docker-compose.yml up --build -d

 
echo '==> Running Docker Images'
docker ps

echo ''
echo 'Medgate at http://<ip>/ '
echo ''
echo 'kibana at http://<ip>/kibana/ '
echo 'webdav at http://<ip>/webdav/ '
echo 'brat at http://<ip>/brat/ '
echo 'NRDA Gateway at http://<ip>/nrdagateway/ '
echo '(note / at the end is required)'

