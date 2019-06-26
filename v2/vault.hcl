ui = true

listener "tcp" {
  address = "10.0.2.15:8200"
  tls_disable = 1
}

#Uncomment if you want to use consul storage for backend (ie, stop playing with the dev server)
# Please note - to unseal vault you have to set VAULT_ADDR='https://<IP set above>'
storage "consul" {
  address = "127.0.0.1:8500"
  path = "vault/"
}
