#!/usr/bin/env python3

"""
This file contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
"""


#pH CONSTANTS [unitless]
PH_GPIO_PIN = 16 #BCM Numbering
PH_LOW = 6.5
PH_HIGH = 8.5
PH_MCP3008_ADC_PIN = 0 #Channel 0 (analog)


#TDS CONSTANTS [parts per million (ppm)]
TDS_GPIO_PIN = 23 #BCM Numbering
TDS_LOW = 0
TDS_HIGH = 0
TDS_MCP3008_ADC_pin = 1 #Channel 1 (analog)


#EC CONSTANTS depends on TDS [µS/cm (microsiemens per centimeter)]
# EC_GPIO_PIN = 23 #BCM Numbering
# EC_LOW = 50
# EC_HIGH = 1500
# EC_MCP3008_ADC_PIN = 1 #Channel 1 (analog)



#Turbidity CONSTANTS [NTU (Nephelometric Turbidity Unit)]
TURBIDITY_GPIO_PIN = 24 #BCM Numbering
TURBIDITY_LOW = 0
TURBIDITY_HIGH = 0
TURBIDITY_MCP3008_ADC_PIN = 2 #Channel 2 (analog)


#Temperature CONSTANTS [°C]
TEMPERATURE_GPIO_PIN = 25 #BCM Numbering
TEMPERATURE_LOW = 10
TEMPERATURE_HIGH = 25


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