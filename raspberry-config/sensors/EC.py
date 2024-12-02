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

Threshold Value: 250 ~ 800µS/cm

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

from .sensor import Analog_Sensor
from .sensor_constants import EC_MCP3008_ADC_PIN, EC_LOW, EC_HIGH

class EC_Sensor(Analog_Sensor):
    '''
    Handles EC Sensor.
    '''
    def __init__(self, channel=EC_MCP3008_ADC_PIN, low_threshold=EC_LOW, high_threshold =EC_HIGH):
        super().__init__(channel)


    def __str__(self):
        return "EC Sensor Active!!!"


    def ec_calculation(self):
        adc_value = self.read_adc()

