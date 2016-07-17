# Wireshark 
### [download for Mac](https://1.na.dl.wireshark.org/osx/Wireshark%202.0.4%20Intel%2064.dmg) -- [docs source](https://www.wireshark.org/docs/wsug_html_chunked/index.html)
[Note: here's great list of step by step walkthroughs for doing things with wireshark](https://en.wikiversity.org/wiki/Wireshark). Also Wireshark is the coolest, complex piece of software, very useful for learning about TCP/IP.

Wireshark is a network packet analyzer (aka packet sniffer, protocol analyzer), capturing packets and displays in detail. Basically a measurement device (think voltmeter)
- offers live capture from several network media, capturing traffic from many media types
- does not manipulate things on the network, only measures things

## Capturing Live Network Data
- Captures from different kinds of network hardware (ethernet, 802.11)
- control flow for capturing (stop after elapsed time, number of packets, amount of data)
- show decoded packets while capturing
- filter packets, reducing the amount of data captured
  - multiple filters can be applied by delimiting the filters with the `and`/`or` ekeywords 

### Set Up a Capture on HTTP requests
As an overview, TCP is the protocol used to connect the client and server, while HTTP is the protocol for transferring media files from the server to the client.

My steps for setting up a local traffic capture:
- requires root, os that supports packet capturing (OSX does), computer time zones should be correct
- `sudo wireshark` to start
- choose the right interface to capture from
  - optionally, `Wireshark > Preferences > Capture` set default interface to Display Ethernet: en15. If this isn't available on your computer, try finding something like `Wi-Fi:en0`
- on the window with "Welcome to Wireshark", clicking on one of the network interfaces on the left will bring up a table of packets. This table is a mess without fliters
  - `go` menu lets you navigate packets
  - `capture` menu controls the current capture
  - `analyze`
- start the capture.
- open [http://kevintpeng.github.io](http://kevintpeng.github.io) or some non-https site
- stop the capture.

#### To select destination traffic: -- [source](https://en.wikiversity.org/wiki/Wireshark/HTTP)

- Observe the traffic captured in the top Wireshark packet list pane. To view only HTTP traffic, type `http` (lower case) in the Filter box and press Enter.
- Select the first HTTP packet labeled `GET /`.
- Observe the destination IP address.
- To view all related traffic for this connection, change the filter to `ip.addr == <destination>`, where <destination> is the destination address of the HTTP packet.

#### Analyze TCP Connection Traffic
- First three TCP packets should be labelled `[SYN]`, `[SYN, ACK]`, `[ACK]`. This is the TCP handshake sequence.
- Select the first packet. Observe the packet details in the middle Wireshark packet details pane. Notice that it is an Ethernet II / Internet Protocol Version 4 / Transmission Control Protocol frame.
- Expand Ethernet II to view Ethernet details. Observe the Destination and Source fields. The destination should be your default gateway's MAC address and the source should be your MAC address. You can use ipconfig /all and arp -a to confirm.
- Expand Internet Protocol Version 4 to view IP details. Observe the Source address. Notice that the source address is your IP address.
- Observe the Destination address. Notice that the destination address is the IP address of the HTTP server.
- Expand Transmission Control Protocol to view TCP details. Observe the Source port. Notice that **it is a dynamic port selected for this HTTP connection. This port is temporarily opened to receive the response packets on your machine.**
- *Note that all of the packets for this connection will have matching MAC addresses, IP addresses, and port numbers.*

#### Analyze HTTP Request Traffic
- select the first packet with `HTTP` as the protocol
- Observe the packet details in the middle Wireshark packet details pane. Notice that it is an Ethernet II / Internet Protocol Version 4 / Transmission Control Protocol / Hypertext Transfer Protocol frame. Also notice that the Ethernet II, Internet Protocol Version 4, and Transmission Control Protocol values are consistent with the TCP connection analyzed
- Expand Hypertext Transfer Protocol to view HTTP details.
- Observe the traffic captured in the top Wireshark packet list pane. Select the fifth packet, labeled `TCP ACK`. This is the server TCP acknowledgement of receiving the `GET` request.

### Let's do this again with HTTPS -- [source](https://en.wikiversity.org/wiki/Wireshark/HTTPS)
- Filter by `ssl` and hit enter. Select the first packet labelled `Client Hello`. Then filter by `ip.addr == <destination>`
- similar to the `http` request but now with `TLS` protocol for encryption
- First three are TCP handshake
- select packet with TLS protocol labelled *Client Hello*, with Secure Sockets Layer information in the packet (Cipher suites like RSA, compression, extentions).
- Select the next packet, labeled TCP ACK. This is the server TCP acknowledgement of receiving the Client Hello request.
- Another TLS packet labelled *Server Hello* should follow, also with SSL information in the packet
- the next TLS packet receives the ssl cert to verfiy the server is who we think it is
- then we send it our public key to encrypt the information
- now Application Data TLS packets are recieved with the encrypted data for our private key to decrypt

### Further Processing of Captures
`ip.addr == 74.125.22.156 and ssl` can be used as the filter to ignore underlying TCP communication packets, and for the IP of rubygems.org.

#### [Comparing two capture files](https://www.wireshark.org/docs/wsug_html_chunked/ChStatCompareCaptureFiles.html)

#### [decrypting ssl traffic](https://jimshaver.net/2015/02/11/decrypting-tls-browser-traffic-with-wireshark-the-easy-way/)
add this to `.bashrc`:
`alias wireshark="SSLKEYLOGFILE=/Users/kevintpeng/sslkeylogs/output.log open -a firefox;
sudo wireshark"`

This logs your browser's SSL keys, as it generates random pub/priv key pairings on the fly for each request. This alias opens a browser that logs these keys to a file accessible by wireshark.

Wireshark > Preferences > Protocols > SSL > set path to (Pre)-Master-Secret log filename to `/Users/kevintpeng/sslkeylogs/output.log`

#### [decrypting ssl for ruby](https://www.trustwave.com/Resources/SpiderLabs-Blog/How-To-Decrypt-Ruby-SSL-Communications-with-Wireshark/)
- ruby uses openssl for SSL/TLS
