#!/usr/bin/env python3
"""redis-py
"""
import redis
import uuid
from typing import Callable


class Cache:
    """py-red class
    """
    def __init__(self):
        """init method
        """
        self._redis = redis.Redis()
        self._redis.flushdb(True)

    def store(self, data: str | bytes | int | float) -> str:
        """storing data to redis
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
    
    # def get(self, key: bytes, fn: Callable):
    #     """getting and converting byte to desired
    #     """ 
    #     if not key:
    #         return "(nil)"
    #     return fn(key)
    
    # def get_str(self, data):
    #     """get string
    #     """
    #     Cache.get(str(data))
    
    # def get_int(self, data):
    #     """get integer
    #     """
    #     Cache.get(int(data))

