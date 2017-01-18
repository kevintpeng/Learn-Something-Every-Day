# IP address
Numeric label assigned to each device participating in a network
- host or network interface identification
- location addressing, within a node or network 

### Reginal Internet Registry
- organization that manages the allocation and registration of Internet number resources
  - IP Address is one example of Internet Numbers
- Africa, America, Asia-Pacific, Latin America, Europe

### IPv4
32 bit integers, 4, period delimited 8 bit integers
- in early IP, network admins interpreted IP addresses in two parts, number and host
- revised as classful network architecture
  - broken into classes A, B, C, A has few networks, with many addresses per network
  - on most systems, localhost resolves to `127.0.0.1` which is the IPv4 loopback address 

### NAT
Network Address Translation, is a method of remapping one IP address space into another by modifying network address information. IPv4 doesn't support enough addresses for the world. IPv6 was years away from implementation when IPv4 address exhaustion was coming. NAT helped slow this problem, by allowing a single router to act as an agent between the public network (internet) and a local private network for entire groups of computers.
- used for ease of rerouting traffic in IP networks without renumbering every host
- essential also for conserving global address space allocation, by sharing one internet-routable IP address of a NAT gateway for an entire private network
- Basic NAT provides one-to-one translation of IP addresses
- Most NATs map one publicly exposed IP address to many private hosts (as is the case for routers)
  - a router on a network has a private address in that address space
  - many-to-one NAT is so common, it is synonymous to NAT
- web browsers in the masqueraded network can access websites outside the network
- browsers outside the network cannot access websites inside the network
- NAT devices today allow network admins to configure static translation table entries for connections from an external network
  - achieved through port forwarding; forwards traffic from a specific external port to an internal host on a specified port

### Default Gateway
Is the node that is assumed to know how to forward packets on to other networks
- a router is an example of the default gateway for all network devices
- nodes (servers, workstations, devices) each have defined default route settings

### Dynamic NAT 
For complex networks. DNAT doesn't make the mapping to the public IP address static, usually uses groups of available public IP addresses.

NAT loopback is a feature in many consumer routers: permits the access of a service via the public IP address from inside the local network.

### IP address assignment
- IP addresses are assigned to a host at the time of booting, or perminantly by fixed hardware/software configuration
- persistent configuration is also known as **static IP addresses**
- when a computer's IP address is assigned newly each time, it is a **dynamic IP address**

### IP Modification
Firewalls perform IP blocking, based on IP addresses of client computers. 
- proxy servers act as an intermediary agent on behalf of the customer
- or NATs on IPv4 can act for multiple computers

### localhost
hostname that means *this computer*
- used to access the network services that are running on the host via its loopback network interface
- IPv4 network standards reserve the entire 127.0.0.0/8 address block for loopback purposes
- the resolution of the name `localhost` into one or more IP addresses is configured by /etc/hosts line `127.0.0.1   localhost`

### DHCP
Dynamic Host Configuration Protocol dynamically distributed network configurations like IP addresses, controlled by DHCP server
- without DHCP servers, sysadmins or some system must distribute static IPs
- DHCP servers assign local IPs on a private network
- distributes default gateway, name servers, time servers
