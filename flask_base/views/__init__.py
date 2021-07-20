from flask_base import app


@app.route('/')
def hello_world():
    return 'Hello World'
