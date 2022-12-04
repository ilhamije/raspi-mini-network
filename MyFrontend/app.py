import requests
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def hello():
    url = 'http://192.168.1.13'
    response = requests.get(url)
    result = response.text

    return render_template("welcome.html",hello_data=result)


if __name__ == '__main__':
    app.run(debug=True, port=5003)
