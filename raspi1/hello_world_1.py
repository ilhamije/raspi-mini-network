from flask import Flask


app = Flask(__name__)

@app.route('/')
def index():
    return 'Raspi 1 said : Hello Jarkomjut'
if __name__ == '__main__':
    app.run(port=5001, host='0.0.0.0')