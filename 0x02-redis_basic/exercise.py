#!/usr/bin/env python3
"""redis-py
"""
import redis
import uuid


class Cache:
    """py-red class
    """
    def __init__(self):
        """init method
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: str | bytes | int | float) -> str:
        """storing data to redis
        """
        self._redis.set(uuid.uuid4(), data)
