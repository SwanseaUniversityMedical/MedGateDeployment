#!/bin/bash

# stop all the running services
if [[ -s ~/MedGateDeployment/docker/docker-compose.yml ]]
then
    docker-compose -f ~/MedGateDeployment/docker/docker-compose.yml stop
fi

# create gcp related directories for initialization 
mkdir -p /gcp/instances/gcp_1/in
mkdir -p /gcp/applications
mkdir -p /gcp/data
mkdir -p /gcp/output


#remove medgate-service container and pull the latest medgate-service image 
if [ "$(docker ps -aq -f name='medgate-service')" ]; then
    # cleanup
    docker-compose rm -f medgate-service
    # pull the latest image
    docker-compose pull medgate-service
fi

docker-compose -f ~/MedGateDeployment/docker/docker-compose.yml up --build -d
docker ps


