#!/usr/bin/env python3

"""
This file contains all package-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.
"""


#pH CONSTANTS [unitless]
PH_GPIO_PIN = 16 #BCM Numbering
PH_LOW = 6.5
PH_HIGH = 8.5
PH_MCP3008_ADC_PIN = 0 #Channel 0 (analog)


#TDS CONSTANTS [milligram per litre (mg/L)]
TDS_GPIO_PIN = 23 #BCM Numbering
TDS_LOW = 0
TDS_HIGH = 500
TDS_MCP3008_ADC_PIN = 1 #Channel 1 (analog)


#EC CONSTANTS depends on TDS [µS/cm (microsiemens per centimeter)]
EC_GPIO_PIN = 23 #BCM Numbering
EC_LOW = 50
EC_HIGH = 1500
EC_MCP3008_ADC_PIN = 1 #Channel 1 (analog)


#Turbidity CONSTANTS [NTU (Nephelometric Turbidity Unit)]
TURBIDITY_GPIO_PIN = 24 #BCM Numbering
TURBIDITY_LOW = 0
TURBIDITY_HIGH = 5
TURBIDITY_MCP3008_ADC_PIN = 2 #Channel 2 (analog)


#Temperature CONSTANTS [°C]
TEMPERATURE_GPIO_PIN = 25 #BCM Numbering
TEMPERATURE_LOW = 10
TEMPERATURE_HIGH = 25