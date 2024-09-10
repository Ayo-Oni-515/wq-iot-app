#!/usr/bin/env python3

"""
This is the main python script for the project's hardware implementation.
It merges the functionality of diifferent aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
control, and so on. 
"""

#Importing Essential Packages
from sensors import *
from control import *
from errors import *

# Importing Raspberry pi library 
# from RPi.GPIO import 

print(EC.value)
print(pump.pump_threshold)