sudo apt-get update -y
sudo apt-get install unzip jq -y

#install Consul
echo "Downloading and Installing Consul"
CONSUL_VERSION=1.5.3
wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip
sudo unzip -d /usr/local/bin/ consul_${CONSUL_VERSION}_linux_amd64.zip

