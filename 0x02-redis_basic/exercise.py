#!/usr/bin/env python3
"""redis-py
"""
import redis
import uuid
from functools import wraps
from typing import Callable, Union, Any


def replay(fn: Callable) -> None:
    '''Displays the call history of a Cache class' method.
    '''
    if fn is None or not hasattr(fn, '__self__'):
        return
    redis_store = getattr(fn.__self__, '_redis', None)
    if not isinstance(redis_store, redis.Redis):
        return
    fxn_name = fn.__qualname__
    in_key = '{}:inputs'.format(fxn_name)
    out_key = '{}:outputs'.format(fxn_name)
    fxn_call_count = 0
    if redis_store.exists(fxn_name) != 0:
        fxn_call_count = int(redis_store.get(fxn_name))
    print('{} was called {} times:'.format(fxn_name, fxn_call_count))
    fxn_inputs = redis_store.lrange(in_key, 0, -1)
    fxn_outputs = redis_store.lrange(out_key, 0, -1)
    for fxn_input, fxn_output in zip(fxn_inputs, fxn_outputs):
        print('{}(*{}) -> {}'.format(
            fxn_name,
            fxn_input.decode("utf-8"),
            fxn_output,
        ))

def call_history(method: Callable) -> Callable:
    """history of inputs and outputs of a Cash calss method
    """
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """wrapper
        """
        inputs_keys = "{}:inputs".format(method.__qualname__)
        outputs_keys = "{}:outputs".format(method.__qualname__)
        if isinstance(self._redis, redis.Redis):
            self._redis.rpush(inputs_keys, str(args))
        output = method(self, *args, **kwargs)
        if isinstance(self._redis, redis.Redis):
            self._redis.rpush(outputs_keys, output)
        return output
    return wrapper

def count_calls(method: Callable) -> Callable:
    """ # of calls made to Cashe class methods
    """
    @wraps(method)
    def wrapper(self, *args, **kwargs) -> Any:
        """returns the method after incrementing call counter
        """
        if isinstance(self._redis, redis.Redis):
            self._redis.incr(method.__qualname__)
        return method(self, *args, **kwargs)
    return wrapper

    return wrapper


class Cache:
    """py-red class
    """
    def __init__(self):
        """init method
        """
        self._redis = redis.Redis()
        self._redis.flushdb(True)

    @count_calls
    @call_history
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

