# Vagrant-vault-consul repo
## Directories
- v4 directory starts with learn.hashicorp.com/vault/day-one/ops-deployment-guide
Here we are going to setup a proper consul and vault cluster, building on the 1:1 version that we had with V3.

We are also playing with setting ip addresses vs DHCP.
vault 	- 192.168.7.70
vault2 	- 192.168.7.72
consul 	- 192.168.7.80
consul2 - 192.168.7.82
consul3 - 192.168.7.83


The clusters:
- Vault (primary), Vault2 (secondary)
- Consul (leader), Consul2,3 (follower)

Files: 
bootstrap.sh 		- installs the latest vault / consul versions (non beta)
bootstrap_vault.sh 	- used for testing new releases / beta releases
bootstrap_consul.sh - installs the latest consul version (non beta)
bootstrap_c.sh 		- used for testing new releases / beta releases

# Consul Info
Consul has been setup following https://learn.hashicorp.com/consul/datacenter-deploy/deployment-guide
- the bootstrap_consul.sh file is built based on the learn pages, however some permissions are opened up to work with vault

manually update /etc/consul.d/server.hcl node_name = "cs[$num]"


`sudo consul agent -server -config-dir=/etc/consul.d -bind={$IP}`


# Vault Info
vault server -config=/vagrant/vault.hcl

# Setting up
- here we will walk through setting up Vault and Consul.
- Start with Consul Server `vagrant ssh consul`

- find out what your IP address for the local server is.  Then run "sudo consul agent -server -config-dir=/etc/consul.d -bind=$IP"

- different tab ssh into vault
- update vault.hcl cluster_addr with your machines ip

- update /vagrant/consul_c1[2].json bind_addr & retry_join (consul server) ips  -- if you aren't using the IP's provided above

- start consul agent on the vault server `sudo consul agent -config-file=/vagrant/consul_c1[2].json`


- start vault server `sudo vault server -config=/home/vagrant/vault.hcl`

- set environment variables (/vagrant/set-env) - update IP first, lol
- init and unseal vault

- Then log into vault2 server.  unseal with the keys generated on vault1.



# Testing your work
vault login <root key>
enable secrets (vault secrets enable kv)
write secrets (vault write kv/my-secret value="I have a one node vault and consul server setup")
read secret (vault read kv/my-secret)


# CLI
consul -autocomplete-install
complete -C /usr/local/bin/consul consul 
exec $SHELL


