# Subdomains
In DNS hierarchy a subdomain is a domain that is part of the main domain
- west.example.com and east.example.com are subdomains of example.com, which is a subdomain of `com` top-level domain (TLD)
- subdomains are defined by editing the [DNS zone file](https://github.com/kevintpeng/Learn-Something-Everyday/blob/master/Networking/DNS%20Resource%20Records.md) pertaining to the parent domain

# DNS Zones
A DNS zone is a portion of hte DNS namespace that is delegating control of portions of the namespace. A zone can contain multiple domains. A server can contain multiple zones. It is important for resolving the ip address of subdomains. 

The zone itself is analogous to a database of subdomain resolutions, which can point to other more specific databases for more specific subdomains. 
- Server A can host the zone for a domain kevintpeng.me, and could for example resolve all subdomains except for testing.kevintpeng.me which can be delegated as a separate DNS zone on a new server, Server B
- Server A holds no fine details about the subdomains within testing.kevintpeng.me.

![zone diagram](http://www.think-like-a-computer.com/files/2011/06/dns_zone_2.png)
