#Run these commands to unseal vault

#vault operator init > key.txt
vault operator unseal $(grep 'Key 1:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 2:' key.txt |awk '{print $NF}')
vault operator unseal $(grep 'Key 3:' key.txt |awk '{print $NF}')
echo $(grep 'Initial Root Token:' key.txt |awk '{print $NF}')
