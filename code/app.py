import flask
import pprint

def create_app():
    app = flask.Flask(__name__)
    app.some_state = 42
    return app

app = create_app()

@app.route("/hello", methods=['GET'])
def hello():
    return flask.jsonify({"foo": 43})
