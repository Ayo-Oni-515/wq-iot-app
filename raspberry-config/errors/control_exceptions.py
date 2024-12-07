#!/usr/bin/env python3

"""
This file contains control exceptions used in the project.
"""

class Tank_Ultrasonic_Sensor_Error(Exception):
    """Handles Tank Ultrasonic Sensor Error"""
    pass


class Test_Kit_Ultrasonic_Sensor_Error(Exception):
    """Handles Test Kit Ultrasonic Sensor Error"""
    pass