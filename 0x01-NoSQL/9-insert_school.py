#!/usr/bin/env python3
"""pymongo practice
"""


def insert_school(mongo_collection, **kwargs):
    """inserting kwargs in collectoin
    """
    doc = mongo_collection.insert_one(kwargs)
    return doc.inserted_id
