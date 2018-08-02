# Sockets
A connection, between two endpoints, each with an IP address and a port

`netstat` is a utility that useful for viewing socket information.
- lists both `unix` and `tcp/udp` sockets
- `LISTEN` means a socket is accepting connections
- `ESTABLISHED` means connection is made and data is flowing

### Unix Domain Sockets (IPC)
Inter-process communication (IPC) mechanism.
- know that they're running on the same machine, so they can omit checks otherwise done by TCP/IP sockets like NAT routing

### IP Sockets (TCP/IP)
Mechanism enabling inter-process communication over the network (or same computer using the loopback interface, localhost)
- more overhead as they require multiple steps for the TCP protocol
