# Web Servers
Web servers are the front-most layer of traffic handling. Setup:
- make you HTTP available from the internet, by configuring your router to send all incoming traffic on port 80 to your server
  - on most cloud platforms, this is handled already
  - locally, it would require going to http://192.168.1.1/, and allowing traffic to pass through firewall
  - choose computer, forward external TCP traffic on port 80 to port 80 (this is port forwarding)
  - people can then connect to your local server via your public IP address
  
## Apache vs Nginx
Both solutions are capable of handling diverse workloads. They are different in what they excel at. One big difference is how they handle connections and traffic.

### Apache
The Apache HTTP server was created in 1995.
- flexible, powerful, well supported, extensible through a dynamically loadable module system

### Nginx
2004, known for light-weight resource utilization and ability to scale easily on minimal hardware
- excels at serving static content quickly
- designed to pass dynamic request off to other software 
- highly responsive under load
- focused on core web server and proxy features

[source](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations)
