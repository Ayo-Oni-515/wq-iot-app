#!/usr/bin/env python3

"""
This file contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability
"""


#Pump CONSTANTS (meters)
PUMP_RELAY_GPIO_PIN = 0 #BCM Numbering
PUMP_LOW = 0
PUMP_HIGH = 0
PUMP_US_TRIG_GPIO = 0    #Tank US trigger pins    
PUMP_US_ECHO_GPIO_PIN = 0    #Tank US echo pins



#test_kit CONSTANTS (meters)
TEST_KIT_GPIO = 0 #BCM Numbering
TEST_KIT_LOW = 0
TEST_KIT_HIGH = 0
TEST_KIT_US_TRIG_GPIO = 0    #Test kit US trigger pins    
TEST_KIT_US_ECHO_GPIO = 0    #Test kit US echo pins


#valves CONSTANTS
VALVES_GPIO = 0 #BCM Numbering
VALVES_LOW = 0
VALVES_HIGH = 0
VALVES_MCP3008_ADC_PIN = 0 #Channel 