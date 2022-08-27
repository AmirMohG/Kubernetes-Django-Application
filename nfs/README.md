### NFS server installation 
```
sudo apt-get install nfs-kernel-server
sudo mkdir /mnt/my_shares
sudo chown nobody:nogroup /mnt/my_shares
# no_root_squash allows changing file owner using the chown command.
sudo cat <<EOF >> /etc/exports
/mnt/my_shares 10.0.0.225/24(rw,sync,no_subtree_check,no_root_squash)
EOF
showmount -e
```
