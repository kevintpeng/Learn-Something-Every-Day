# Domain Name System
- A **hostname** is a label assigned to a device connected to a computer network, nicknames for IP addresses.
- if a computer were a telephone, then the IP address is the phone number and the DNS methodology is the phone book, while a DNS record to find a computer might be similar to using your first and last name to look up your phone number
- DNS is hierarchical system, where `.com`, `.org`, `.ca`, are examples of **TLDs (Top-Level Domains)**
- there are [different kinds of dns records](./DNS%20Resource%20Records.md)
- **name servers** are designated for translating domain names to IP addresses
  - these are hierarchical much like FQDNs themselves
  - authoritative name servers give answers to queries about domains under their control, and otherwise redirect requests
  - the **zone file** lives on the name server and is used to identify which IP address should be contacted
- DNS primarily uses UDP because the client will know to retry with TCP if needed, and UDP is reliable enough while its simplicity is well suited for DNS

### Resolution
1. `/etc/hosts` to see if it has that domain name locally
2. checks DNS cache (client-side)
3. contact ICANN root DNS server
4. redirects to TLD servers
5. redirects to Domain-level name servers
6. domain-level server can return the proper IP address

### `nslookup`
Tool for making queries to name servers, which uses `resolv.conf` for its name servers

### `resolv.conf`
File used to configure the system's DNS resolver
- resolving is the process of determining the IP address from a domain name
- a DNS resolver is responsible for initiating and sequencing queries that lead to the right resource (translation of domain name into IP address)
- an individual DNS query may be non-recursive, recursive, iterative, combinations of these
- when DHCP is used, it is usually updated with `resolvconf` utility
- `nameserver` directive determines the IP address of a name server
- `search` and `domain` directives help to resolve short hostnames by suffixing domains during resolution
- note that `etc/hosts` is used for local machine customization that acts as an override to this

### Round Robin DNS
A DNS server can respond with a list of A records (host names) and then the client should use each with equal frequency, client side load balancing

### Errors
- `NXDOMAIN` means that the domain name is not known by the DNS server
- `SERVFAIL` says the FQDN exists but the authoritative name servers are not responding
