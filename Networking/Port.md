# Port (computer networking)
Always associated with an IP address of the host and the protocol type of the communication. A port is an endpoint of communication in an OS. 
- Port is identified by a 16 bit number (0 to 65535). 
- Ports are ncessary for the client-server model of applications. 

### Common ports
- 21: FTP
- 22: SSH
- 53: DNS service
- 80: HTTP
- 110: Post Office Protocol (POP3, email)
- 443: HTTP Secure
- `$ less /etc/services/` shows a list of well-known TCP and UDP port numbers

### Opening TCP ports
- `nc` is netcat utility, used for anything TCP/UDP
- opens TCP connections, send UDP packets, listen on arbitrary TCP or UDP ports, port scanning, deal with IPv4 and IPv6
- `nc -l 5000` opens port 5000

### Port Forwarding
An application of NAT (essentially IP remapping), that redirects a communication request from one address and port number combination to another, as packets pass through a router.
- most commonly used to make a service on a host that resides on a private network (behind a router) available to hosts on the opposite side of the gateway
- done by remapping the destination IP address and port num to an internal host
