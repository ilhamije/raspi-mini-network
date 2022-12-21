from flask import Flask, send_from_directory


app = Flask(__name__)

@app.route('/')
def index():
    return 'Raspi 1 said : Hello Jarkomjut'

@app.route('/image_test')
def image_test():
    filename = 'makara-iluni-hitam.png'
    return send_from_directory("", filename)


if __name__ == '__main__':
    app.run(port=5001, host='0.0.0.0')
