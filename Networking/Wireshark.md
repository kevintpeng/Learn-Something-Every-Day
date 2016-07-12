# Wireshark 
### [download for Mac](https://1.na.dl.wireshark.org/osx/Wireshark%202.0.4%20Intel%2064.dmg) -- [docs source](https://www.wireshark.org/docs/wsug_html_chunked/index.html)
Wireshark is a network packet analyzer (aka packet sniffer, protocol analyzer), capturing packets and displays in detail. Basically a measurement device (think voltmeter)
- offers live capture from several network media, capturing traffic from many media types
- does not manipulate things on the network, only measures things

### Set Up a Capture
My steps for setting up a local traffic capture:
- requires root, os that supports packet capturing (OSX does), computer time zones should be correct
- choose the right interface to capture from 
  - `Wireshark > Preferences > Capture` set default interface to Display Ethernet: en15
- click it on the welcome window, will bring up a table of packets
  - `go` menu lets you navigate packets
  - `capture` menu controls the current capture
  - `analyze` 
