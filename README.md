# This is the server installation script to support the MedGATE project

## Docker and Git proxy settings 

1. If docker is living behind a **proxy** server, please apply the following changes in https://docs.docker.com/config/daemon/systemd/#httphttps-proxy 

2. For git, you may consider something like:
```
git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
git config --global https.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
```

## Get Started

Set credentials for PostgreSQL, FTP, WebDAV and ElasticSearch in `medgate.config` as well as the proxy.

If docker is not installed run `installdocker.sh`

run in console `run.sh`

run as server `install.sh`

stop server `stop.sh`

### MedGate

http://yourIP:80

### Kibana

http://yourIP:5601

### Elasticsearch

http://yourIP:9200

## Note

gcp-2.8.1 is for test use ONLY. It is **NOT** used in the docker-compose file until the official gcp docker image is released.

Elasticsearch invalid license for 6.1.4. So need to upgrad it to the latest one.
