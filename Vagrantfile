Vagrant.configure("2") do |config|
#Vault Server
  config.vm.define "vault" do |v|
    v.vm.box = "ubuntu/trusty64"
    v.vm.hostname = "vault"
    v.vm.provision :shell, path: "bootstrap.sh"
  end
#Consul Server
  config.vm.define "consul" do |c|
    c.vm.box = "ubuntu/trusty64"
    c.vm.hostname = "consul"
    c.vm.provision :shell, path: "bootstrap_consul.sh"
    end
end

