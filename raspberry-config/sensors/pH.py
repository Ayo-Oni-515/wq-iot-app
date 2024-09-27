#!/usr/bin/env python3

"""
pH Sensor: Liquid PH 0-14 Value Sensor Module Accuracy 0.1pH + BNC Connect Terminal PH 
Electrode Probe Kit, PH Detection detect Sensor Module for Arduino.

Operating Voltage: 5.0V

Analog Output: 0.0 ~ 5.0V (>3.3v reference)

Control Signal  (Input): 
              
Type: Analog Sensor.

Unit: unitless.

Conversion Factor:

Measuring Range: 0 ~ 14pH

Accuracy: ±0.1pH (25°C)

Response time: ≤ 1min.

Threshold Value:

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit (2 μA max)
"""

def ph_post(channel, args):
    '''
    Meant to perform Power On Self Test (POST)
    '''
    status = 0
    return status


def ph(args):
    pass