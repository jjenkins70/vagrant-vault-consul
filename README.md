#Vagrant-vault-consul repo
# Directories
- v2 directory follows the inital learn path - and ends with having consol in dev mode as storage on your vault server.

#Background
These scripts were put together while I was reviewing https://learn.hashicorp.com/vault/

#Requirements
- Install vagrant on your machine
- clone the repo to a local directory
- run vagrant up

#Files
- Vagrantfile -- main control file for Vagrant
- bootstrap.sh -- bootstraps vault server instance
- bootstrap_consol.sh - bootstraps consul server instance

#How
- vagrant ssh vault
- copy vault.hcl to local directory (or not)
- update vault.hcl IP address to your vault instance
you can now use UI from your machine.  or you can vault login root from another command line

- vault server -dev -config=/vagrant/vault.hcl -dev-root-token-id='root'  

- run "/vagrant/set-env.sh" to set the VAULT_ADDR variable.  - be sure to update IP variable to your local machine / vm


#Using Consul
- When you are ready to use consul - (ie not store things in memory anymore) uncomment the consul section in vault.hcl and run consul agent -dev
then
- vault server -config=/vagrant/vault.hcl

you can then run the /vagrant/unseal.sh scripts - first you have to set your environment though

# Neat (to me) CLI hacks
- When you initially unseal 'vault operator init > key.txt'
- then to unseal 'vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}') 
- - repeat for keys 2, 3.

#Commands to always remember
- vault -autocomplete-install ; exec $SHELL



 
