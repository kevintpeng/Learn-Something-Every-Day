# DNS Resource Records
There are many types of DNS record types ([source](https://en.wikipedia.org/wiki/List_of_DNS_record_types)). These are all specified in a [DNS zone](https://github.com/kevintpeng/Learn-Something-Everyday/blob/master/Networking/Subdomains%20and%20DNS%20Zones.md) file, which ultimately resolves domain names to ip addresses or other types of records:
- **SOA**: Start of Authority, mandatory in all zone files, it identifies DNS information about the domain like the name of the DNS server, version, default TTL
- **A:** Address Record, returns a 32-bit IPv4 address
- **AAAA:** IPv6 Address Record, returns a 128-bit IPv6 address
- **CNAME:** Canonical Name Record, aliases one name to another, the DNS lookup will continue by retrying with the new name
- **NS:** Name Server Record, delegates a DNS zone to use instead of the current DNS zone
- **MX:** Mail Exchange Record, maps a domain name to a list of message transfer agents for that domain
- **TXT**: Text Record, plain text, often used to carry data (like a basic api)
- **PTR**: Reverse DNS record, takes IP address and returns DNS record

TTL (time to live) is another field in the DNS zone file, which specifies how long a caching server should serve the record from its cache rather than from the nameserver again.
