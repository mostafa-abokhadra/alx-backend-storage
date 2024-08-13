#!/usr/bin/env python3
"""pymongo practice
"""


def list_all(mongo_collection):
    """list all docs in collection
    """
    if mongo_collection:
        return mongo_collection.find()
    return []
