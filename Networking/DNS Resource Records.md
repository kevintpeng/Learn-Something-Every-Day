# DNS Resource Records
There are many types of DNS record types ([source](https://en.wikipedia.org/wiki/List_of_DNS_record_types)). These are all specified in a [DNS zone](https://github.com/kevintpeng/Learn-Something-Everyday/blob/master/Networking/Subdomains%20and%20DNS%20Zones.md) file
- **A:** Address Record, returns a 32-bit IPv4 address
- **AAAA:** IPv6 Address Record, returns a 128-bit IPv6 address
-**CNAME:** Canonical Name Record, aliases one name to another, the DNS lookup will continue by retrying with the new name
- **NS:** Name Server Record, delegates a DNS zone to use instead of the current DNS zone
- **MX:** Mail Exchange Record, maps a domain name to a list of message transfer agents for that domain
- **TXT**: Text Record, plain text, often used to carry data (like a basic api)
