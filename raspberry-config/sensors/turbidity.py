#!/usr/bin/env python3

"""
Turbidity Sensor: DFRobot Gravity Analog Turbidity Sensor.

Operating Voltage: 5.0V

Operating Current: 40mA (MAX)

Analog Output: 0.0 ~ 4.5V (>3.3v reference)
                
Type: Analog Sensor.

Unit: NTU (Nephelometric Turbidity Unit)

Threshold Value: 0 ~ 5NTU

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
**Requires calibration.
"""

from .sensor import Analog_Sensor
from .sensor_constants import TURBIDITY_MCP3008_ADC_PIN

class Turbidity_Sensor(Analog_Sensor):
    '''
    Handles Turbidity Sensor.
    '''
    def __init__(self, channel=TURBIDITY_MCP3008_ADC_PIN):
        super().__init__(channel)


    def turbidity(self):
        # Final turbidity reading
        return self.read_digital()
