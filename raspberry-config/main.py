#!/usr/bin/env python3

"""
This is the main python script for the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
operation and control.
"""

#Importing Python Packages
import time

#Importing Essential Packages
import sensors as snse
import control as ctrl
import errors as err

#GPIO cleanup from previous state (Automatically resets the GPIO Pins before startup)
# GPIO.cleanup()

#Sensor GPIO Initialization (Set from packages)

# GPIO.cleanup()