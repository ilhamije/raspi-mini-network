### Configure Load Balancer

#### Install Apache2
```
$ sudo apt install apache2
```

#### Setup the load balancer
```
$ sudo vi  /etc/apache2/sites-available/000-default.conf
```
Then edit the file like this
```
<Proxy "balancer://mycluster">
        BalancerMember "http://<raspi1-ip-address>:5001"
        BalancerMember "http://<raspi2-ip-address>:5002"

        ProxySet lbmethod=bytraffic
</Proxy>
ProxyPass "/" "balancer://mycluster"
ProxyPassReverse "/" "balancer://mycluster"
```
Restart Apache2
```
$ systemctl restart apache2
```
#### Testing
Check you ip address, by running
```
$ ifconfig
```
Access it via browser.
In this case, LoadBalancer IP address is 192.168.1.13

It will change the endpoint everytime it's reloaded.

Returned response from Raspi 1
![Raspi 1 response](/screenshots/lb-raspi1.png "Raspi 1")

Returned response from Raspi 2
![Raspi 2 response](/screenshots/lb-raspi2.png "Raspi 2")

