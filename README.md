This is the server installation script to support the MedGATE project

IF docker not installed the run installdocker.sh

to run in console  run.sh
to run as server install.sh
to stop server stop.sh

FTP Access (will need to be configure dynamically)
for PASV mode need to state PUBLICHOST - currently staticly set

ftp 192.168.69.5
username: nlp
password: password123
Kibana
http://192.168.69.5:56001

Elasticsearch
http://192.168.69.5:9200


Note. gcp-2.8.1 is for test use ONLY. It is NOT used in the docker-compose file until the official gcp docker image is release.

