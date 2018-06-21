# This is the server installation script to support the MedGATE project

## Get Started

Set credentials in `medgate.config`

If docker is not installed run `installdocker.sh`

run in console `run.sh`

run as server `install.sh`

stop server `stop.sh`

### FTP

FTP Access (will need to be configured dynamically)

for PASV mode need to state PUBLICHOST - currently staticly set

ftp 192.168.69.5

username: nlp

password: password123

### Kibana

http://192.168.69.5:5601

### Elasticsearch

http://192.168.69.5:9200

## Note

gcp-2.8.1 is for test use ONLY. It is **NOT** used in the docker-compose file until the official gcp docker image is released.
