#!/usr/bin/env python3

"""
pH Sensor: Liquid PH 0-14 Value Sensor Module Accuracy 0.1pH + BNC Connect Terminal PH 
Electrode Probe Kit, PH Detection detect Sensor Module for Arduino.

Operating Voltage: 5.0V

Analog Output: 0.0 ~ 5.0V (>3.3v reference)
              
Type: Analog Sensor.

Unit: unitless.

Measuring Range: 0 ~ 14pH

Accuracy: ±0.1pH (25°C)

Response time: ≤ 1min.

Threshold Range: 6.5 ~ 8.5pH

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit (2 μA max)
**Requires Buffer Solution for proper calibration
Note: Final Reading requires stabilization
"""

from sensor import Analog_Sensor
from sensor_constants import PH_MCP3008_ADC_PIN


class PH_Sensor(Analog_Sensor):
    '''
    Handles pH Sensor.
    '''
    def __init__(self, channel=PH_MCP3008_ADC_PIN):
        super().__init__(channel)


    def ph(self):
        # Final ph reading
        return self.read_digital()
