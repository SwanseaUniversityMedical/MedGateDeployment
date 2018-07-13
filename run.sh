#!/bin/bash

echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''

export host_ip=$(ip address | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.' )
# FOR DEMO, easier
# export host_ip=localhost

# stop all the running services
echo '==> Stopping any running MedGATE services'
docker-compose -f ~/MedGateDeployment/docker/docker-compose.yml stop

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

echo '==> Pulling latest image for MedGATE services'
#remove medgate-service container and pull the latest medgate-service image 
if [ "$(docker ps -aq -f name='medgate-service')" ]; then
    # remove existing medgate-service container
    docker rm -f medgate-service
    # pull the latest medgate-service image
    docker pull swanseauniversitymedical/medgate-dev:latest
fi

echo '==> Building Docker Images'
docker-compose -f ~/MedGateDeployment/docker/docker-compose.yml up --build -d

clear
echo '==> Running Docker Images'
docker ps
