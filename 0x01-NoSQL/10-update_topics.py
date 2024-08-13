#!/usr/bin/env python3
"""pymongo practice
"""


def update_topics(mongo_collection, name, topics):
    """changing all school topics based on name
    """
    mongo_collection.update_many(
        {"name": name},
        {"$set", {"topics": topics}}
    )
