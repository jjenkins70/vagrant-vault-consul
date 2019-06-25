#Vagrant-vault-consul repo

#Background
These scripts were put together while I was reviewing https://learn.hashicorp.com/vault/

#Requirements
Install vagrant on your machine
clone the repo to a local directory
run vagrant up

#Files
Vagrantfile -- main control file for Vagrant
bootstrap.sh -- bootstraps vault server instance
bootstrap_consol.sh - bootstraps consul server instance

#How
vagrant ssh vault
copy vault.hcl to local directory (or not)
update vault.hcl IP address to your vault instance

vault server -dev -config=/vagrant/vault.hcl -dev-root-token-id='root'

you can now use UI from your machine.  or you can vault login root from another command line



 
