### Dependencies:
```
sudo apt install vim
sudo apt install python3-flask
```


#### Install flask
```
sudo apt install python3-flask
```


#### ON each Raspberry PI

Create Project Directory:
```
$ mkdir /home/pi/MyWebserver
```

Create flask file:
```
$ touch /home/pi/MyWebserver/hello_world_1.py
```

See content in <b>raspi1</b> directory


#### To make it run when it booted
Create our service:
```
$ vi /etc/systemd/system/flaskraspi1.service
```

Then start the service, service name is <b>flaskraspi1</b> for device 1
```
sudo systemctl start flaskraspi1
sudo systemctl status flaskraspi1
```
If something wrong, update the service with proper setting. Then restart the service.

If status is OK, run this command
```
sudo systemctl enable flaskraspi1
```