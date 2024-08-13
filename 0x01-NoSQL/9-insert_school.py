#!/usr/bin/env python3
"""pymongo practice
"""


def insert_school(mongo_collection, **kwargs):
    """inserting kwargs in collectoin
    """
    return mongo_collection.insert(kwargs).inserted_id

