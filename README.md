# This is the server installation script to support the MedGATE project

## Get Started

Set credentials for PostgreSQL, FTP, WebDAV and ElasticSearch in `medgate.config` as well as the proxy.

If docker is not installed run `installdocker.sh`

run in console `run.sh`

run as server `install.sh`

stop server `stop.sh`

### Kibana

http://youIP:5601

### Elasticsearch

http://youIP:9200

## Note

gcp-2.8.1 is for test use ONLY. It is **NOT** used in the docker-compose file until the official gcp docker image is released.
