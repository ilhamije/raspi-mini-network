Install flask
sudo apt install python3-flask

ON Raspberry PI 1

Create Project Directory:
```
$ mkdir /home/pi/MyWebserver
```

Create flask file:
```
$ /home/pi/MyWebserver/hello_world_1.py
```

Content:
```
from flask import Flask


app = Flask(__name__)

@app.route('/')
def index():
    return 'Raspi 1 said : Hello Jarkomjut'
if __name__ == '__main__':
    app.run(port=5001, host='0.0.0.0')
```

To make it run when it booted, create our service:
```
/etc/systemd/system/flaskraspi1.service
```

then start the service
```
sudo systemctl start my_project
sudo systemctl status my_project
```