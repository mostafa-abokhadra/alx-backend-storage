#!/user/bin/env python3
"""pymongo practice
"""
import pymongo


def list_all(mongo_collection):
    """list all docs in collection
    """
    if mongo_collection:
        return mongo_collection.find()
    return []


if __name__ == '__main__':
    list_all()
