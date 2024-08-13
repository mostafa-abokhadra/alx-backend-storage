#!/usr/bin/env python3
"""pymongo practice
"""
from pymongo import MongoClient


# def main():
#     """main function
#     """
#     client = MongoClient('mongodb://127.0.0.1:27017')
#     db = client['logs']
#     collection = db.nginx
#     collection.create_index('method')
#     data = collection.find()

#     listy = list(data)
#     lenght = len(listy)
#     get, post, put, patch, delete = 0, 0, 0, 0, 0
#     get_and_status = 0

#     for dict in listy:
#         if dict['method'] == 'GET':
#             get = get + 1
#         elif dict['method'] == 'POST':
#             post = post + 1
#         elif dict['method'] == 'PATCH':
#             patch += 1
#         elif dict['method'] == 'PUT':
#             put = put + 1
#         elif dict['method'] == 'DELETE':
#             delete = delete + 1
#         if dict['method'] == 'GET' and dict['path'] == '/status':
#             get_and_status = get_and_status + 1

#     print(lenght, "logs")
#     print("Methods:")
#     print("\tmethod GET: {}".format(get))
#     print("\tmethod POST: {}".format(post))
#     print("\tmethod PUT: {}".format(put))
#     print("\tmethod PATCH: {}".format(patch))
#     print("\tmethod DELETE: {}".format(delete))
#     print("{} status check".format(get_and_status))

# def main():
#     """ main func
#     """
#     client = MongoClient('mongodb://127.0.0.1:27017')
#     collection = client.logs.nginx
#     total = collection.count_documents({})
#     get = collection.count_documents({"method": "GET"})
#     post = collection.count_documents({"method": "POST"})
#     put = collection.count_documents({"method": "PUT"})
#     patch = collection.count_documents({"method": "PATCH"})
#     delete = collection.count_documents({"method": "DELETE"})
#     path = collection.count_documents(
#         {"method": "GET", "path": "/status"})
#     print(f"{total} logs")
#     print("Methods:")
#     print(f"\tmethod GET: {get}")
#     print(f"\tmethod POST: {post}")
#     print(f"\tmethod PUT: {put}")
#     print(f"\tmethod PATCH: {patch}")
#     print(f"\tmethod DELETE: {delete}")
#     print(f"{path} status check")


# if __name__ == "__main__":
#     main()
def log_stats():
    """ log_stats.
    """
    client = MongoClient('mongodb://127.0.0.1:27017')
    logs_collection = client.logs.nginx
    total = logs_collection.count_documents({})
    get = logs_collection.count_documents({"method": "GET"})
    post = logs_collection.count_documents({"method": "POST"})
    put = logs_collection.count_documents({"method": "PUT"})
    patch = logs_collection.count_documents({"method": "PATCH"})
    delete = logs_collection.count_documents({"method": "DELETE"})
    path = logs_collection.count_documents(
        {"method": "GET", "path": "/status"})
    print(f"{total} logs")
    print("Methods:")
    print(f"\tmethod GET: {get}")
    print(f"\tmethod POST: {post}")
    print(f"\tmethod PUT: {put}")
    print(f"\tmethod PATCH: {patch}")
    print(f"\tmethod DELETE: {delete}")
    print(f"{path} status check")


if __name__ == "__main__":
    log_stats()
