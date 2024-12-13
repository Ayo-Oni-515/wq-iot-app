#!/usr/bin/env python3

"""
Total Dissolved Solids(TDS) Sensor: Gravity: Analog TDS Sensor for Arduino.

Operating Voltage: 3.3V ~ 5.5V

Analog Output: 0 ~ 2.3V (<3.3v reference)

Type: Analog Sensor.

Unit: parts per million (ppm) or mg/L (milligram per liter).

Conversion Factor: 1 ppm == 1 mg/L

Measuring Range: 0 ~ 1000ppm (converted to mg/L => 1 ppm = 1 mg/L)

Accuracy: ± 10% F.S. (25 ℃)

Threshold Value: 0 ~ 500mg/L

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

from sensor import Analog_Sensor
from sensor_constants import TDS_MCP3008_ADC_PIN


class TDS_Sensor(Analog_Sensor):
    '''
    Handles TDS Sensor.
    '''
    def __init__(self, channel=TDS_MCP3008_ADC_PIN):
        super().__init__(channel)

    def tds(self):
        # Final tds reading
        return self.read_digital()