#!/usr/bin/env python3

"""
Temperature Sensor: BOJACK DS18B20 Temperature Sensor Module Kit 
with Waterproof Stainless Steel Probe for Raspberry Pi

Operating Voltage: 3.0 - 5.25V

Control Signal: 3.3V (Communication through the 1-Wire Protocol.)

Type: Digital Sensor.

Unit: °C or °F.

Conversion Factor:

Measuring Range: -55℃ ~ +125℃ (-67℉ ~ +257℉)

Resolution: 9-bit ~ 12-bit (10-bit)

Threshold Value: 10 ~ 25℃

**It can be powered directly by the raspberry pi.
Adapter module is equipped with a pull-up resistor, and 
directly connects to the GPIO of the Raspberry Pi without an 
external resistor.

Interfacing Protocol: 1-Wire Protocol.

**Enable the 1-wire protocol.
"""
from .sensor import Digital_Sensor

class Temperature_Sensor(Digital_Sensor):
    '''
    Handles Temperature Sensor.
    '''
    def __init__(self):
        super().__init__()
    

    def temperature(self):
        # Final temperature reading
        return self.read_digital()