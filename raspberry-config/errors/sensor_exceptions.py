#!/usr/bin/env python3

"""
This file contains sensor exceptions used in the project.
"""

class PH_Sensor_Error(Exception):
    """Handles pH Sensor Error"""
    pass


class Temperature_Sensor_Error(Exception):
    """Handles Temperature Sensor Error"""
    pass


class TDS_Sensor_Error(Exception):
    """Handles TDS Sensor Error"""
    pass


class EC_Sensor_Error(TDS_Sensor_Error):
    """Handles EC Sensor Error"""
    pass


class Turbidity_Sensor_Error(Exception):
    """Handles Turbidity Sensor Error"""
    pass
