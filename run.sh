#!/bin/bash

echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''

case "$OSTYPE" in
linux*)
    echo "OS: LINUX"
    export ftp_host_ip=$(ip address | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.')
    cp -f ./docker/docker-compose.linux.yml ./docker/docker-compose.yml
    ;;

msys*)
    echo "OS: WINDOWS"
    export ftp_host_ip=$(ipconfig | grep IPv4 | grep -Eo '([0-9]*\.){3}[0-9]*' | grep 192.168)
    cp -f ./docker/docker-compose.win.yml ./docker/docker-compose.yml
    ;;

darwin*)
    echo "OS: OSX"
    exit 1
    ;;

*)
    echo "Unsupported OS: $OSTYPE"
    exit 1
    ;;
esac

if [ -z $ftp_host_ip ]; then
    echo $ftp_host_ip
fi

# get FTP username for mounting correct volumes in docker-compose
FTP_USER=$(grep 'FTP_USER' medgate.config) && export MEDGATE_FTP_USER=${FTP_USER//'FTP_USER='/}

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
mkdir -p /brat-data
mkdir -p /brat-cfg

echo '==> Pulling latest image for MedGATE services'
#remove medgate-service container and pull the latest medgate-service image
if [ "$(docker ps -aq -f name='medgate-service')" ]; then
    # remove existing medgate-service container
    docker rm -f medgate-service medgate-webdav
    # pull the latest medgate-service image
    docker pull swanseauniversitymedical/medgate-dev:latest
fi

echo '==> Building Docker Images'
docker-compose -f ./docker/docker-compose.yml up --no-recreate -d

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
