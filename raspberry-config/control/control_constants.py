#!/usr/bin/env python3


"""
This file contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.
"""

import sys

#Pump CONSTANTS (centimetres): BCM Numbering
TANK_RELAY_GPIO = 22         #Tank relay pin
TANK_LOW = 200               #Empty tank (cm): For a 7 feet tank
TANK_HIGH = 30               #Full Tank (cm): US Blind Area < 20cm (Full Tank)
TANK_US_TRIG_GPIO = 25       #Tank US trigger pin    
TANK_US_ECHO_GPIO = 16       #Tank US echo pin


#test_kit CONSTANTS (centimeters): BCM Numbering           
TEST_KIT_LOW = 20            #Empty Test Kit (cm) i.e. Length of the test kit
TEST_KIT_HIGH = 6.5          #Full Test Kit (cm): Max Sensor immersion depth
TEST_KIT_US_TRIG_GPIO = 23   #Test kit US trigger pin    
TEST_KIT_US_ECHO_GPIO = 24   #Test kit US echo pin

INLET_VALVE_RELAY_GPIO = 17  #Test kit inlet valve relay pin
OUTLET_VALVE_RELAY_GPIO = 27 #Test kit outlet valve relay pin


if __name__ ==  "__main__":
    sys.exit(0)