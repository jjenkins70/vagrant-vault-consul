path "secret/*" {
  capabilities = ["create"]
}

path "secret/foo" {
  capabilities = ["read"]
}

path "secret/data/*" {
  capabilities = ["create"]
}

path "secret/data/foo" {
  capabilities = ["read"]
}
