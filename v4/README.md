#Vagrant-vault-consul repo
# Directories
- v3 directory starts with learn.hashicorp.com/vault/day-one/ops-deployment-guide

# Consul Info
Consul has been setup following https://learn.hashicorp.com/consul/datacenter-deploy/deployment-guide
- the bootstrap_consul.sh file is built based on the learn pages, however some permissions are opened up to work with vault

consul agent -server -config-dir=/etc/consul.d -bind=172.28.128.12


# Vault Info
vault server -config=/vagrant/vault.hcl

# Setting up
- here we will walk through setting up Vault and Consul.
- Start with Consul Server (vagrant ssh consul)
- find out what your IP address for the local server is.  Then run "sudo consul agent -server -config-dir=/etc/consul.d -bind=$IP"

- different tab ssh into vault
- update vault.hcl cluster_addr with your machines ip
- update /vagrant/consul.json bind_addr & retry_join (consul server) ips
- start consul agent on the vault server (sudo consul agent -config-file=/vagrant/consul.json)
- start vault server (sudo vault server -config=/vagrant/vault.hcl)
- set environment variables (/vagrant/set-env) - update IP first, lol
- init and unseal vault

# Testing your work
vault login <root key>
enable secrets (vault secrets enable kv)
write secrets (vault write kv/my-secret value="I have a one node vault and consul server setup")
read secret (vault read kv/my-secret)


# CLI
consul -autocomplete-install
complete -C /usr/local/bin/consul consul 
exec $SHELL




