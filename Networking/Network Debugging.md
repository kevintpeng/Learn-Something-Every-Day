# Network Debugging
Summarizing some of my thought process, first determine what layer the issue is happening in. Probably layer 7 (HTTP, DNS, or other protocols), layer 4 (transport layer TCP UDP), or layer 3 (network layer IPv4, ICMP). Always describe the problem in a sentence.
- **HTTP and DNS layer 7 issues** 
  - `nslookup` and `ping` can be useful for debugging layer 7 DNS issues, `traceroute` lets you trace the DNS lookup
  - `/etc/resolv.conf` contents generally dictate what nameservers will be used and with what domain suffixes during DNS lookup
  - `/etc/hosts` can locally alias certain address to records
  - `curl -v` is useful for checking HTTP response headers and body
- **tcp udp layer 4 issues** 
  - wireshark can be very useful for catching issues here, like which requests are being sent and where
  - `netstat` can be useful for whitebox testing to see if a machine is listening on the right port
- **routing layer 3 issues** 
  - `ifconfig` is used for information about network interfaces
  - `ping` of course is an easy way to see if a hostname or address is discoverable
  
