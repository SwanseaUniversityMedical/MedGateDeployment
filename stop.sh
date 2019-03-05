echo '--------------'
echo '-  MedGATE   -'
echo '--------------'
echo ''
echo '==> Stopping MedGATE service'

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
    export ftp_host_ip=127.0.0.1
fi
###

docker-compose -f ./docker/docker-compose.yml stop
