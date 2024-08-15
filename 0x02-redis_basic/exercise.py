#!/usr/bin/env python3
"""redis-py
"""
import redis
import uuid
from typing import Callable, Union


class Cache:
    """py-red class
    """
    def __init__(self):
        """init method
        """
        self._redis = redis.Redis()
        self._redis.flushdb(True)

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """storing data to redis
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
    
    def get(self, key: str, fn: Callable = None) -> Union[str, bytes, int, float]:
        """getting and converting byte to desired
        """ 
        data = self._redis.get(key)
        return fn(data) if fn is not None else data
    
    def get_str(self, key: str) -> str:
        """get string
        """
        return self.get(key, lambda x: x.decode('utf-8'))
    
    def get_int(self, key: str) -> int:
        """get integer
        """
        return self.get(key, lambda x: int(x))
