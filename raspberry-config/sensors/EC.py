#!/usr/bin/env python3

"""
Electrical Conductivity Sensor: Gravity: Analog TDS Sensor for Arduino.
"Calculations will be made from the TDS sensor(TDS.py)"

Operating Voltage: 3.3V ~ 5.5V

Analog Output: 0 ~ 2.3V (<3.3v reference)

Control Signal  (Input) : 

Type: Analog Sensor.

Unit: µS/cm (microsiemens per centimeter)

Conversion Factor:

Measuring Range:

Accuracy: ± 10% F.S. (25 ℃)

Threshold Value:

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

value = 10

def EC_post(args):
    """
    Meant to perform Power On Self Test (POST)
    """
    pass


def tds_to_ec(args):
    pass

