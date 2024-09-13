#!/usr/bin/env python3

"""
This is the main python script for the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
control, and so on. 
"""

#Importing Python Packages
import time


# Importing Raspberry pi packages
# import RPi.GPIO as GPIO


#Importing Essential Packages
from constants import *
from sensors import *
from control import *
from errors import *

#GPIO setup
# GPIO.setmode(GPIO.BCM)
# GPIO.setup()
# GPIO.setup()
# GPIO.setup()
# GPIO.setup()
# GPIO.setup()
# GPIO.setup()

print(EC.value)
print(pump.pump_threshold)

#SENSORS


#CONTROL