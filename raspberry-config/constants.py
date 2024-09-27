#!/usr/bin/env python3

"""
This file contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
"""


#EC CONSTANTS depends on TDS [µS/cm (microsiemens per centimeter)]
EC_GPIO = 0 #BCM Numbering
EC_LOW = 50
EC_HIGH = 1500
EC_MCP3208_ADC = 0 #Channel 0


#pH CONSTANTS [unitless]
PH_GPIO = 0 #BCM Numbering
PH_LOW = 6.5
PH_HIGH = 8.5
PH_MCP3208_ADC = 1 #Channel 1


#TDS CONSTANTS [parts per million (ppm)]
TDS_GPIO = 0 #BCM Numbering
TDS_LOW = 0
TDS_HIGH = 0
TDS_MCP3208_ADC = 2 #Channel 2


#temperature CONSTANTS [°C]
TEMPERATURE_GPIO = 0 #BCM Numbering
TEMPERATURE_LOW = 10
TEMPERATURE_HIGH = 25


#turbidity CONSTANTS [NTU (Nephelometric Turbidity Unit)]
TURBIDITY_GPIO = 0 #BCM Numbering
TURBIDITY_LOW = 0
TURBIDITY_HIGH = 0
TURBIDITY_MCP3208_ADC = 2 #Same as TDS


#pump CONSTANTS (meters)
PUMP_RELAY_GPIO = 0 #BCM Numbering
PUMP_LOW = 0
PUMP_HIGH = 0
PUMP_MCP3208_ADC = 0 #Channel  
PUMP_US_TRIG_GPIO = 0    #Tank US trigger pins    
PUMP_US_ECHO_GPIO = 0    #Tank US echo pins



#test_kit CONSTANTS (meters)
TEST_KIT_GPIO = 0 #BCM Numbering
TEST_KIT_LOW = 0
TEST_KIT_HIGH = 0
TEST_KIT_MCP3208_ADC = 0 #Channel 
TEST_KIT_US_TRIG_GPIO = 0    #Test kit US trigger pins    
TEST_KIT_US_ECHO_GPIO = 0    #Test kit US echo pins


#valves CONSTANTS
VALVES_GPIO = 0 #BCM Numbering
VALVES_LOW = 0
VALVES_HIGH = 0
VALVES_MCP3208_ADC = 0 #Channel 