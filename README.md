#Vagrant-vault-consul repo

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

#Using Consul
- When you are ready to use consul - (ie not store things in memory anymore) uncomment the consul section in vault.hcl and run
- vault server -config=/vagrant/vault.hcl

# Neat (to me) CLI hacks
- When you initially unseal 'vault operator init > key.txt'
- then to unseal 'vault operator unseal $(grep 'Key 1:' key.txt | awk '{print $NF}') 
- - repeat for keys 2, 3.



 
