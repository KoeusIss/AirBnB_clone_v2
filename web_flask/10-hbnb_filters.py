#!/usr/bin/python3
"""WebFlask application module"""
from flask import Flask, render_template
from models import storage
app = Flask(__name__)


@app.route('/hbnb_filters', strict_slashes=False)
def show_filters():
    """Shows filters"""
    from models.state import State
    from models.amenity import Amenity
    states = storage.all(State).values()
    amenities = storage.all(Amenity).values()
    return render_template("6-index.html", states=states, amenities=amenities)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
