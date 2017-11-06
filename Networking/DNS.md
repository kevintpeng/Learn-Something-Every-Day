# Hostname
A label assigned to a device connected to a computer network, nicknames for IP addresses.
- on the internet, hostnames have a DNS domain appended to them

# Domain Name System
decentralized naming system for computers and services connected to the internet
- translates domain names to the numerical IP addresses need for the purpose of locating and identifying services and devices

### DNS Zone
Any distinct contiguous portion of the domain name space in the Domain Name System. 

The domain name space of the Internet is a hierarchy of subdomains below the DNS root domain. Individual domains serve as delagation points. It is desirable to implement fine grained boundaries of delegation, so sub-levels of a domain can be managed independently.

[source](https://en.wikipedia.org/wiki/Domain_Name_System)

### `resolv.conf`
File used to configure the system's DNS resolver
- resolving is the process of determining the IP address from a domain name
- a DNS resolver is responsible for initiating and sequencing queries that lead to the right resource (translation of domain name into IP address)
- an individual DNS query may be non-recursive, recursive, iterative, combinations of these
- when DHCP is used, it is usually updated with `resolvconf` utility
- `nameserver` directive determines the IP address of a name server
- `search` and `domain` directives help to resolve short hostnames by suffixing domains during resolution
- note that `etc/hosts` is used for local machine customization that acts as an override to this

### `nslookup`
Tool for making queries to name servers, which uses `resolv.conf` for its name servers

## Other DNS concepts
### Round Robin DNS 
A DNS server can respond with a list of A records (host names) and then the client should use each with equal frequency

### Errors
- `NXDOMAIN` means that the domain name is not known by the DNS server
- `SERVFAIL` says the FQDN exists but the authoritative name servers are not responding
