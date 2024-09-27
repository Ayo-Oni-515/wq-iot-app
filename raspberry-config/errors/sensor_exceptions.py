#!/usr/bin/env python3

"""
This file contains exceptions  used in the project.
"""

class phError(Exception):
    pass


class temperatureError(Exception):
    pass


class tdsError(Exception):
    pass


class ecError(tdsError):
    pass


class turbidityError(Exception):
    pass
