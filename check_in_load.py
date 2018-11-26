import itertools
import requests
import argparse
from pprint import pprint
from urllib.parse import urljoin
import json
from dateutil.parser import parse
from datetime import timedelta


fname = 'catchup_load_main.txt'


class PAXLoader(object):
    api_token = None
    base = 'http://pax-enforcers.herokuapp.com/'
    # base = 'http://127.0.0.1:8000/'
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

    def load_file(self, day_delay=0):
        event_id = self.event['id']
        with open(self.input_file) as f:
            content = f.readlines()
        # you may also want to remove whitespace characters like `\n` at the end of each line
        content = [x.strip() for x in content]

        checkins_by_days = [list(y) for x, y in itertools.groupby(content, lambda z: '=' in z) if not x]
        pprint(checkins_by_days)

        user_cache = {}
        for day in checkins_by_days:
            for item in day:
                (handle,checkin) = item.split(',')
                if handle not in user_cache:
                    username = handle.replace(' ', '_')
                    user_params = {'username': username}
                    user_obj = self._get_from_api('/user', user_params)
                    if user_obj:
                        user_cache[handle] = user_obj['id']
                    else:
                        user_cache[handle] = None
        for x,v in user_cache.items():
            fail = False
            if not v:
                print(x)
                fail = True
            if fail:
                raise KeyError('Correct input for previously listed users')
        event_user_cache = {}
        for handle, user_id in user_cache.items():
            if handle not in event_user_cache:
                eu_params = {'event': event_id, 'user': user_id}
                eu_obj = self._get_from_api('/event_user', eu_params)
                event_user_cache[handle] = eu_obj['id']
        pprint(event_user_cache)

        first_day = parse(self.event['start_date'])
        for i, day in enumerate(checkins_by_days):
            for item in day:
                (handle, checkin) = item.split(',')
                (start, end) = checkin.split('-')
                date_obj = first_day + timedelta(days=i + day_delay)
                start_time = parse(start).replace(year=date_obj.year, month=date_obj.month, day=date_obj.day)
                end_time = parse(end).replace(year=date_obj.year, month=date_obj.month, day=date_obj.day)
                checkin_body = {'event_user': event_user_cache[handle],
                                'start_date': start_time.isoformat('T'),
                                'end_date': end_time.isoformat('T')}
                print('{}: {} - {}'.format(handle, start_time, end_time))
                self._post_to_api('/check_in', checkin_body)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--username', required=True)
    parser.add_argument('--password', required=True)
    parser.add_argument('--input-file', required=True)
    parser.add_argument('--day-delay', type=int, default=0)
    args = parser.parse_args()

    # username = args.username
    # password = args.password
    # input_file = args.input_file

    pl = PAXLoader(args.username, args.password, args.input_file)
    pl.load_file(day_delay=args.day_delay)