sudo apt-get update &&
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common &&
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" &&
    sudo apt-get update &&
    sudo apt-get install -y docker-ce &&
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo curl -x http://192.168.10.15:8080 -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo sysctl -w vm.max_map_count=262144
