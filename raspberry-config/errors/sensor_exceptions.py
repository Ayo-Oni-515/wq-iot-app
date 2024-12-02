#!/usr/bin/env python3

"""
This file contains exceptions  used in the project.
"""

class phError(Exception):
    """Handles pH Sensor Error"""
    pass


class temperatureError(Exception):
    """Handles Temperature Sensor Error"""
    pass


class tdsError(Exception):
    """Handles TDS Sensor Error"""
    pass


class ecError(tdsError):
    """Handles EC Sensor Error"""
    pass


class turbidityError(Exception):
    """Handles Turbidity Sensor Error"""
    pass
