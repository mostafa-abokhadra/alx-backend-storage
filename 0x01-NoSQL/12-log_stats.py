#!/usr/bin/env python3
"""pymongo practice
"""
from pymongo import MongoClient


client = MongoClient('mongodb://127.0.0.1:27017')
db = client['logs']
collection = db.nginx
collection.create_index('method')
data = collection.find()

listy = list(data)
lenght = len(listy)
get, post, put, patch, delete = 0, 0, 0, 0, 0
get_and_status = 0

for dict in listy:
    if dict['method'] == 'GET':
        get = get + 1
    elif dict['method'] == 'POST':
        post = post + 1
    elif dict['method'] == 'PATCH':
        patch += 1
    elif dict['method'] == 'PUT':
        put = put + 1
    elif dict['method'] == 'DELETE':
        delete = delete + 1
    if dict['method'] == 'GET' and dict['path'] == '/status':
        get_and_status = get_and_status + 1

print(lenght, "logs")
print("Methods:")
print("\tmethod GET: {}".format(get))
print("\tmethod POST: {}".format(post))
print("\tmethod PUT: {}".format(put))
print("\tmethod PATCH: {}".format(patch))
print("\tmethod DELETE: {}".format(delete))
print("{} status check".format(get_and_status))