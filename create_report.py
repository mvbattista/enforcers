import csv
import requests
import argparse
from pprint import pprint
from urllib.parse import urljoin
import json
from dateutil.parser import parse
from datetime import timedelta, date

class PAXReport(object):
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

    @staticmethod
    def _convert_seconds_to_str(seconds):
        in_seconds = seconds
        if not isinstance(seconds, int):
            try:
                in_seconds = int(seconds)
            except ValueError:
                in_seconds = int(float(seconds))

        h = in_seconds // 3600
        m = (in_seconds % 3600) // 60
        sec = (in_seconds % 3600) % 60
        result = '{}:{:0>2d}:{:0>2d}'.format(h, m, sec)
        return result

    @staticmethod
    def total_time(start_date, end_date):
        if not end_date:
            return None
        else:
            return end_date - start_date

    @staticmethod
    def daterange(start_date, end_date):
        for n in range(int((end_date - start_date).days + 1)):
            yield start_date + timedelta(n)

    def __init__(self, username='admin', password=None, input_file=None):
        self.api_token = self._get_token(username, password)
        self.input_file = input_file
        self._setup_event()

    def _get_from_api(self, url, params=None, force_list=False):
        if not params:
            params = {}
        headers = {'Content-type': 'application/json', 'Authorization': self.api_token}
        url = urljoin(self.base, 'api/' + url)
        req = requests.get(url, params, headers=headers)
        req.raise_for_status()
        result = req.json()
        if len(result) == 1 and not force_list:
            return result[0]
        elif not result:
            if force_list:
                return []
            else:
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

    def create_report(self):
        all_data = []
        event_id = self.event['id']
        start_date = parse(self.event['work_start_date'])
        end_date = parse(self.event['work_end_date'])
        eu_params = {'event': event_id,}
        eu_objs = self._get_from_api('/event_user', eu_params)
        for eu_obj in eu_objs:
            user_obj = self._get_from_api('/user/{}'.format(eu_obj['user']))
            eu_id = eu_obj['id']
            user_handle = user_obj['handle']
            user_report = {'Handle': user_handle}
            eu_checkins = self._get_from_api('/check_in', {'event_user': eu_id}, force_list=True)
            # if not eu_checkins:
            #     eu_checkins = []
            for x in eu_checkins:
                x['start_date'] = parse(x['start_date'])
                x['end_date'] = parse(x['end_date'])

            for single_date in self.daterange(start_date, end_date):
                day_work = [x for x in eu_checkins if x['start_date'].date() == single_date.date()]
                day_sum = sum([self.total_time(x['start_date'], x['end_date']) for x in day_work], timedelta())
                user_report[str(single_date.date())] = self._convert_seconds_to_str(day_sum.seconds)
                user_report['Total'] = self._convert_seconds_to_str(eu_obj['total_time'])
            all_data.append(user_report)

        with open(self.event['name']+ ' Time Report.csv', 'w') as csvfile:
            fieldnames = ['Handle',]
            for single_date in self.daterange(start_date, end_date):
                fieldnames.append(str(single_date.date()))
            fieldnames.append('Total')
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(all_data)

        pprint(all_data)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--username', required=True)
    parser.add_argument('--password', required=True)
    args = parser.parse_args()

    pl = PAXReport(args.username, args.password)
    pl.create_report()


            # print single_date.strftime("%Y-%m-%d")
