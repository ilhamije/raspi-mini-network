import requests
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def hello():
    LB_URL = 'http://192.168.1.17'
    BACKEND1_URL = 'http://192.168.1.12'

    response = requests.get(LB_URL)  # change url to use between LB and BE
    result = response.text

    return render_template("welcome.html",hello_data=result)


if __name__ == '__main__':
    app.run(debug=True, port=5003)
