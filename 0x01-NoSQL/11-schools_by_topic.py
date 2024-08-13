#!/usr/bin/env python3
"""pymongo practice
"""


def schools_by_topic(mongo_collection, topic):
    """list of school with certain topic
    """
    # contain = []
    # all = mongo_collection.find()
    # for dictionary in all:
    #     if topic in dictionary.topics:
    #         contain.append(dict(dictionary))
    # return contain
    return mongo_collection.find({"topics": topic})
