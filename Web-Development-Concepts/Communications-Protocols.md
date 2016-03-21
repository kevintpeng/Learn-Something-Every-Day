# TCP/IP model
The following shows the basic relationship between common protocols, dipicting the internet layering scheme:

![Reference Image](https://upload.wikimedia.org/wikipedia/en/thumb/a/a6/Internet_layering.svg/717px-Internet_layering.svg.png)

## About TCP
Transmission Control Protocol (TCP) is a protocol aimed at reliable data transfer, with large overhead in comparison to UDP and RTP. TCP specifies several header fields that are verified by the receiver, including a checksum (hash sum), port information and transfer rate information. 

TCP provides host-host connectivity via the Transport Layer (from the Internet Model). TCP is a layer of abstraction below protocols like HTTP.

## About UDP
User Datagram Protocol (UDP) is a core protocol for simple, connectionless transmission. There is no handshaking and is unreliable. The main benefit is the latancy boost and lower amount of data being transferred.
