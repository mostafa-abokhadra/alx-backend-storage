#!/usr/bin/env python3
"""pymongo practice
"""


def schools_by_topic(mongo_collection, topic):
    """list of school with certain topic
    """
    contain = []
    all = mongo_collection.find()
    for dict in all:
        if topic in dict.topics:
            contain.append(dict)
    return contain
