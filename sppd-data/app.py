from flask import Flask
from flask_restplus import Api
from werkzeug.utils import cached_property

def create_app():
	new_app = Flask(__name__)
	return new_app
	
app = create_app()

api_args = {
	'title': 'SPPD Data',
	'description': 'SPPD Data collects and organizes data from South Park: Phone Destroyer',
}

api = Api(**api_args)

api.init_app(app)

if __name__ == '__main__':
	app.run(host='0.0.0.0')
