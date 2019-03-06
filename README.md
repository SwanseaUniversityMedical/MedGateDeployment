# This is the server installation script to support the MedGATE project

## Get Started

Set credentials for PostgreSQL, FTP, WebDAV and ElasticSearch in `medgate.config` as well as the proxy.

Install Docker for your OS [here](https://hub.docker.com/search/?type=edition&offering=community).

Install Git for your OS [here](https://git-scm.com/downloads).

### Docker and Git proxy settings

1. If docker is living behind a **proxy** server, please apply the following changes in [https://docs.docker.com/config/daemon/systemd/#httphttps-proxy](https://docs.docker.com/config/daemon/systemd/#httphttps-proxy)

2. For git, you may consider something like:

```shell
git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
git config --global https.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
```

### Linux

Bash Via Terminal

- Start MedGate Services `sudo bash run.sh`.

- Stop MedGate Services `sudo bash stop.sh`.

- Remove MedGate Services `sudo bash remove.sh`, your data will **not** be purged.

- Reset MedGate Services `sudo bash reset.sh`, note this will purge all associated data including the uploaded documents.

### Windows

Start Git Bash as Administrator:

- Start MedGate Services `bash run.sh`.

- Stop MedGate Services `bash stop.sh`.

- Remove MedGate Services `bash remove.sh`, your data will **not** be purged.

- Reset MedGate Services `bash reset.sh`, note this **will purge** all associated data including the uploaded documents.

### MedGate

http://yourIP/

### Kibana

http://yourIP/kibana/

Others

kibana at http://<ip>/kibana/ 
webdav at http://<ip>/webdav/ 
brat at http://<ip>/brat/ 
NRDA Gateway at http://<ip>/nrdagateway/
