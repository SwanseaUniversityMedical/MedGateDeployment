echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''
echo '==> Stopping MedGATE service'

export ftp_host_ip=$(ip address | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.' )
export host_ip=0.0.0.0

docker-compose -f ./docker/docker-compose.yml stop
