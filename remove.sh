echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''
echo '==> Removing MedGATE service'

###
# this is for disabling a warning message
export ftp_host_ip=$(ip address | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.' )
if [ -z $ftp_host_ip ]
then
    export ftp_host_ip=127.0.0.1
fi
###

docker-compose -f ./docker/docker-compose.yml rm