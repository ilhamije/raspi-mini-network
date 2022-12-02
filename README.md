This is our basic setup to have Raspberry PI connected and run in headless mode (without monitor, additional keyboard / mouse). We used SSH access for each device.

<br/>

### Hardware Part
Install [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
#### Note
Set the username, password, ssh access, and network credentials before start to write the SDCard. For example, I chose username 'pi' for Raspi number 1, and 'pi2' for Raspi number 2. It's easier to remember and avoid confusion.

#### Accessing Raspberry PI
Check your network admin page and see DHCP client list to get your Raspi IP address. This is Raspi IP address on my local network:
```
$ ssh pi@192.168.1.14
```
Put the password (from previous setting in Raspberry PI Imager)

<br/>
### Software Part
#### Once you logged in, Install this dependencies:
```
sudo apt install vim
sudo apt install python3-flask
```
We're not using PIP since we only need the Raspi's environment.


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

See content in <b>raspi1</b> directory. Edit and save it as you wish.
I put port 5001 for raspi1 and 5002 for raspi2.

Test the webserver:
```
$ cd MyWebserver
$ python hello_world_1.py
```

If you see something like this, you're good.
```
 * Debug mode: on
 * Running on http://0.0.0.0:5001/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 990-273-069
```


#### To make the flask run when it booted
Create our service:
```
$ vi /etc/systemd/system/flaskraspi1.service
```

Then start the service, service name is <b>flaskraspi1</b> for device 1
```
sudo systemctl start flaskraspi1
sudo systemctl status flaskraspi1
```
<br/>
If something <b>wrong</b> :x:, update the service with proper setting. Then restart the service.

This is the result of wrong service setup:
```
● flaskraspi2]1.service - My Raspi 1
     Loaded: loaded (/etc/systemd/system/flaskraspi1.service; disabled; vendor preset: enabled)
     Active: failed (Result: exit-code) since Fri 2022-12-02 16:22:21 WIB; 5s ago
    Process: 1152 ExecStart=/usr/bin/python /home/pi2/MyWebserver/hello_world_2.py (code=exited, status=200/CHDIR)
   Main PID: 1152 (code=exited, status=200/CHDIR)
        CPU: 7ms

Dec 02 16:22:21 raspberrypi2 systemd[1]: flaskraspi1.service: Scheduled restart job, restart counter is at 5.
Dec 02 16:22:21 raspberrypi2 systemd[1]: Stopped My Raspi 1.
Dec 02 16:22:21 raspberrypi2 systemd[1]: flaskraspi1.service: Start request repeated too quickly.
Dec 02 16:22:21 raspberrypi2 systemd[1]: flaskraspi1.service: Failed with result 'exit-code'.
Dec 02 16:22:21 raspberrypi2 systemd[1]: Failed to start My Raspi 1.
```
<br/>
If the service is <b>running properly</b> :white_check_mark:, you'll see something like this:

```
● flaskraspi1.service - My Raspi 1
     Loaded: loaded (/etc/systemd/system/flaskraspi1.service; disabled; vendor preset: enabled)
     Active: active (running) since Fri 2022-12-02 10:17:53 WIB; 7s ago
   Main PID: 1907 (python)
      Tasks: 1 (limit: 1596)
        CPU: 1.593s
     CGroup: /system.slice/flaskraspi1.service
             └─1907 /usr/bin/python /home/pi/MyWebserver/hello_world_1.py

Dec 02 10:17:53 raspberrypi systemd[1]: Started My Raspi 1.
Dec 02 10:17:54 raspberrypi python[1907]:  * Serving Flask app "hello_world_1" (lazy loading)
Dec 02 10:17:54 raspberrypi python[1907]:  * Environment: production
Dec 02 10:17:54 raspberrypi python[1907]:    WARNING: This is a development server. Do not use it in a production deployment.
Dec 02 10:17:54 raspberrypi python[1907]:    Use a production WSGI server instead.
Dec 02 10:17:54 raspberrypi python[1907]:  * Debug mode: off
Dec 02 10:17:54 raspberrypi python[1907]:  * Running on http://0.0.0.0:5001/ (Press CTRL+C to quit)
```

Then you can run this command to make it "permanent"
```
sudo systemctl enable flaskraspi1
```

#### Same process goes with raspberry pi #2
Change these:
```
hello_world_1.py --> hello_world_2.py
/home/pi --> home/pi2
flaskraspi1.service --> flaskraspi2.service
```

<br/>
That's all. Thanks!
