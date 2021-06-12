# OpenVPN with Squid inside Docker

## Usage

1. Download the VPN providers openvpn files & certificates 
2. Copy them into the Docker hosts' subfolder `./vpn/conf/conf-openvpn`
3. Create a symbolic link to `default.conf`, which is going to be used when the container starts
```bash   
    $ cd ./vpn/conf/conf-openvpn
    $ ln -sf openvpn.ovpn default.conf
```
4. Start the services
```bash
    $ ./start.sh
```

*   *alternatively if services are already running*:

```bash
    $ docker-compose restart
```
5. Configure the browser to proxy through
* Host: \<IP address\> of Docker host
* Port: 3128


## Notes

This installation uses two services:

1. svc_vpn
2. svc_proxy

### svc_vpn : OpenVPN & Squid3
This container runs the OpenVPN client. It also runs the Squid3 proxy server to accept to be tunneled through the VPN.


### svc_proxy : socat
For some reason, Dockers' port forwarding directly from the hosts' 3128 port to the `svc_vpn` containers internal 3128 port stops working when OpenVPN is connected.

As a workardound, i'm placing this container in the same network, let Docker forward the hosts' port 3128 to this containers' internal port 3128, and then use `socat` to redirect the traffic to the `svc_vpn` containers' port 3128.