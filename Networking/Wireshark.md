# Wireshark 
### [download for Mac](https://1.na.dl.wireshark.org/osx/Wireshark%202.0.4%20Intel%2064.dmg) -- [docs source](https://www.wireshark.org/docs/wsug_html_chunked/index.html)
Wireshark is a network packet analyzer (aka packet sniffer, protocol analyzer), capturing packets and displays in detail. Basically a measurement device (think voltmeter)
- offers live capture from several network media, capturing traffic from many media types
- does not manipulate things on the network, only measures things

### Capturing Live Network Data
- Captures from different kinds of network hardware (ethernet, 802.11)
- control flow for capturing (stop after elapsed time, number of packets, amount of data)
- show decoded packets while capturing
- filter packets, reducing the amount of data captured

### Set Up a Capture on HTTP requests
My steps for setting up a local traffic capture:
- requires root, os that supports packet capturing (OSX does), computer time zones should be correct
- `sudo wireshark` to start
- choose the right interface to capture from 
  - `Wireshark > Preferences > Capture` set default interface to Display Ethernet: en15
- click it on the welcome window, will bring up a table of packets
  - `go` menu lets you navigate packets
  - `capture` menu controls the current capture
  - `analyze`
- start the capture.
- open [http://kevintpeng.github.io](http://kevintpeng.github.io) or some non-https site
- stop the capture.

#### To select destination traffic: -- [source](https://en.wikiversity.org/wiki/Wireshark/HTTP)

- Observe the traffic captured in the top Wireshark packet list pane. To view only HTTP traffic, type http (lower case) in the Filter box and press Enter.
- Select the first HTTP packet labeled `GET /`.
- Observe the destination IP address.
- To view all related traffic for this connection, change the filter to `ip.addr == <destination>`, where <destination> is the destination address of the HTTP packet.

#### Analyze TCP Connection Traffic
- First three TCP packets should be labelled `[SYN]`, `[SYN, ACK]`, `[ACK]`. This is the TCP handshake sequence.
- Select the first packet. Observe the packet details in the middle Wireshark packet details pane. Notice that it is an Ethernet II / Internet Protocol Version 4 / Transmission Control Protocol frame.
- Expand Ethernet II to view Ethernet details. Observe the Destination and Source fields. The destination should be your default gateway's MAC address and the source should be your MAC address. You can use ipconfig /all and arp -a to confirm.
- Expand Internet Protocol Version 4 to view IP details. Observe the Source address. Notice that the source address is your IP address.
- Observe the Destination address. Notice that the destination address is the IP address of the HTTP server.
- Expand Transmission Control Protocol to view TCP details. Observe the Source port. Notice that it is a dynamic port selected for this HTTP connection. This is to receive the response packets on your machine.
- *Note that all of the packets for this connection will have matching MAC addresses, IP addresses, and port numbers.*

#### Analyze HTTP Request Traffic
- select the first packet with `HTTP` as the protocol
- Observe the packet details in the middle Wireshark packet details pane. Notice that it is an Ethernet II / Internet Protocol Version 4 / Transmission Control Protocol / Hypertext Transfer Protocol frame. Also notice that the Ethernet II, Internet Protocol Version 4, and Transmission Control Protocol values are consistent with the TCP connection analyzed
- Expand Hypertext Transfer Protocol to view HTTP details.
- Observe the traffic captured in the top Wireshark packet list pane. Select the fifth packet, labeled TCP ACK. This is the server TCP acknowledgement of receiving the GET request.

