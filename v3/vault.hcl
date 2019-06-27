ui = true

listener "tcp" {
  #address = "10.0.2.15:8200"
  address = "0.0.0.0:8200"
  cluster_address = "172.28.128.4:8201"
  tls_disable = 1
}

storage "consul" {
  address = "127.0.0.1:8500"
  path = "vault/"
  #token = "{{ ffb0e1dc-790e-e4e3-27d8-0fbfc3e5df3d }}"
}

