import argparse
from urllib.parse import urljoin
import json
import csv

import requests


class PAXLoader(object):
    api_token = None
    # base = 'http://pax-enforcers.herokuapp.com/'
    base = 'http://127.0.0.1:8000/'
    event = {
        'name': 'PAX West 2018',
        'time_zone': 'America/Los_Angeles',
        'start_date': '2018-08-31',
        'end_date': '2018-09-03',
        'work_start_date': '2018-08-28',
        'work_end_date': '2018-09-04'
    }
    username = 'admin'
    new_password = 'welcome1'

    def __init__(self, username='admin', password=None, input_file=None):
        self.api_token = self._get_token(username, password)
        self.input_file = input_file
        self._setup_event()

    def _get_from_api(self, url, params):
        headers = {'Content-type': 'application/json', 'Authorization': self.api_token}
        url = urljoin(self.base, 'api/' + url)
        req = requests.get(url, params, headers=headers)
        req.raise_for_status()
        result = req.json()
        if len(result) == 1:
            return result[0]
        elif not result:
            return None
        return result

    def _post_to_api(self, url, body):
        headers = {'Content-type': 'application/json', 'Authorization': self.api_token}
        url = urljoin(self.base, 'api/' + url)
        request = requests.post(url, json.dumps(body), headers=headers)
        r = request.json()
        request.raise_for_status()
        print('Created {} {}'.format(url, r.get('id')))
        return r

    def _get_token(self, username, password):
        body = {'username': username, 'password': password}
        headers = {'Content-type': 'application/json'}
        url = urljoin(self.base, '/api/token')
        request = requests.post(url, json.dumps(body), headers=headers)
        r = request.json()
        result = r.get('token')
        return 'Token ' + result

    def _setup_event(self):
        event_obj = self._get_from_api('/event', {'name': self.event['name']})
        if not event_obj:
            event_obj = self._post_to_api('/event', self.event)
        self.event['id'] = event_obj.get('id')

    def setup_users(self):
        event_id = self.event['id']
        with open(self.input_file) as csvfile:
            reader = csv.DictReader(csvfile)
            all_users = list(reader)
        for x in all_users:
            username = x['handle'].replace(' ','_')
            user_params = {'username': username}
            user_obj = self._get_from_api('/user', user_params)
            if user_obj:
                user_id = user_obj['id']
            else:
                payload = {
                    'password': self.new_password,
                    'handle': x['handle'],
                    'username': username,
                }
                for f in ('first_name', 'last_name'):
                    if x[f]:
                        payload[f] = x[f]
                user_obj = self._post_to_api('/user', payload)
                user_id = user_obj.get('id')
            eu_params = {'event': event_id, 'user': user_id}
            eu_obj = self._get_from_api('/event_user', eu_params)
            if not eu_obj:
                self._post_to_api('/event_user', eu_params)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--username', required=True)
    parser.add_argument('--password', required=True)
    parser.add_argument('--input-file', required=True)
    args = parser.parse_args()

    # username = args.username
    # password = args.password
    # input_file = args.input_file

    pl = PAXLoader(args.username, args.password, args.input_file)
    pl.setup_users()
    print(pl.api_token)
