# VPN setup
```bash
sudo nano /etc/network/interface*
# change dns-nameservers 8.8.8.8 8.8.4.4, these are Google's Nameservers 
# this will perminently change your resolv.conf file, for DNS resolution

ifdown eth0
ifup eth0
```

[source](http://askubuntu.com/questions/201603/should-i-edit-my-resolv-conf-file-to-fix-wrong-dns-problem)
