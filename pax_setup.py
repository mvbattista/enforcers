import argparse
from urllib.parse import urljoin
import json

import requests

class PAXLoader(object):
    api_token = None
    base = 'http://127.0.0.1:8000/'
    event = 'PAX West 2018'
    # prod_base = 'http://pax-enforcers.herokuapp.com/
    username = 'admin'

    def __init__(self, username='admin', password=None):
        self.api_token = self._get_token(username, password)


    def _get_token(self, username, password):
        body = { 'username': username, 'password': password }
        headers = {'Content-type': 'application/json'}
        url = urljoin(self.base, '/api/token')
        request = requests.post(url, json.dumps(body), headers=headers)
        r = request.json()
        result = r.get('token')
        return 'Token '+ result

    def _setup_event(self, event_name):
        pass


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--username', required=True)
    parser.add_argument('--password', required=True)
    parser.add_argument('--input-file',
                        # required=True
                        )
    args = parser.parse_args()

    username = args.username
    password = args.password
    input_file = args.input_file

    pl = PAXLoader(username, password)
    print(pl.api_token)
