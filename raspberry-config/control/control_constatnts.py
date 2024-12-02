#!/usr/bin/env python3


"""
This file contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.
"""


#Pump CONSTANTS (centimetres)
PUMP_RELAY_GPIO_PIN = 0 #BCM Numbering
PUMP_LOW = 0
PUMP_HIGH = 0
PUMP_US_TRIG_GPIO_PIN = 0    #Tank US trigger pin    
PUMP_US_ECHO_GPIO_PIN = 0    #Tank US echo pin
PUMP_MIN_DISTANCE = 25       #US Blind Area < 20cm (Full Tank)
PUMP_MAX_DISTANCE = 0        #Low water level 


#test_kit CONSTANTS (ccentimeters)
TEST_KIT_GPIO = 0 #BCM Numbering
TEST_KIT_LOW = 0
TEST_KIT_HIGH = 0
TEST_KIT_US_TRIG_GPIO = 0    #Test kit US trigger pin    
TEST_KIT_US_ECHO_GPIO = 0    #Test kit US echo pin
TEST_KIT_MIN_DISTANCE = 15   #Max Sensor immersion depth
TEST_KIT_MAX_DISTANCE = 0    #Low water level 


#valves CONSTANTS
VALVES_GPIO = 0 #BCM Numbering
VALVES_LOW = 0
VALVES_HIGH = 0
VALVES_MCP3008_ADC_PIN = 0 #Channel


# Pin configuration
TRIG = 23  # GPIO pin connected to the TRIG pin
ECHO = 24  # GPIO pin connected to the ECHO pin
