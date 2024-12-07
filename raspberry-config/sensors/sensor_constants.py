#!/usr/bin/env python3

"""
This file contains all package-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.
"""
import sys

#pH CONSTANTS [unitless]
PH_LOW = 6.5
PH_HIGH = 8.5
PH_MCP3008_ADC_PIN = 0 #Channel 0 (analog)


#TDS CONSTANTS [milligram per litre (mg/L) => same as ppm]
TDS_HIGH = 500
TDS_MCP3008_ADC_PIN = 1 #Channel 1 (analog)


#EC CONSTANTS depends on TDS [µS/cm (microsiemens per centimeter)]
EC_LOW = 250
EC_HIGH = 800
# EC_MCP3008_ADC_PIN = 1 #Channel 1 (analog)


#Turbidity CONSTANTS [NTU (Nephelometric Turbidity Unit)]
TURBIDITY_HIGH = 5
TURBIDITY_MCP3008_ADC_PIN = 2 #Channel 2 (analog)


#Temperature CONSTANTS [°C]
TEMPERATURE_GPIO_PIN = 4 #BCM Numbering (Uses 1-wire)
TEMPERATURE_LOW = 10
TEMPERATURE_HIGH = 25 # or 30

if __name__ ==  "__main__":
    sys.exit(0)