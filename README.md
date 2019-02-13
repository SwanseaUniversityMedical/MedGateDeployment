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

run in console `sudo sh run.sh`

stop server `sudo sh stop.sh`

remove server `sudo sh remove.sh`

reset server `sudo sh reset.sh`, note this will purge all associated data including your uploaded documents.

### MedGate

http://yourIP/

### Kibana

http://yourIP/kibana/

Others

kibana at http://<ip>/kibana/ 
webdav at http://<ip>/webdav/ 
brat at http://<ip>/brat/ 
NRDA Gateway at http://<ip>/nrdagateway/

