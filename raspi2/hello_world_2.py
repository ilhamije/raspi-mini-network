from flask import Flask, send_from_directory


app = Flask(__name__)

@app.route('/')
def index():
    return 'Raspi 2 said : Hello Jarkomjut'

@app.route('/image_test')
def image_test():
    filename = 'makara-iluni-kuning.png'
    return send_from_directory("", filename)


if __name__ == '__main__':
    app.run(port=5002, host='0.0.0.0')
