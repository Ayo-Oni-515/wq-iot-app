#!/usr/bin/env python3

"""
Total Dissolved Solids(TDS) Sensor: Gravity: Analog TDS Sensor for Arduino.

Operating Voltage: 3.3V ~ 5.5V

Analog Output: 0 ~ 2.3V (<3.3v reference)

Control Signal  (Input) : 

Type: Analog Sensor.

Unit: parts per million (ppm) or mg/L (milligram per liter).

Conversion Factor:

Measuring Range: 0 ~ 1000ppm

Accuracy: ± 10% F.S. (25 ℃)

Threshold Value:

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

def tds_post(args):
    '''
    Meant to perform Power On Self Test (POST)
    '''
    pass

def tds(args):
    pass