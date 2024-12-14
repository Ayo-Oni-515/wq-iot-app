#!/usr/bin/env python3

"""
Electrical Conductivity Sensor: Gravity: Analog TDS Sensor for Arduino.
"Calculations will be made from the TDS sensor(TDS.py)"

Operating Voltage: 3.3V ~ 5.5V

Analog Output: 0 ~ 2.3V (<3.3v reference)

Type: Analog Sensor.

Unit: µS/cm (microsiemens per centimetre)

Conversion Factor: 0.64 (converting from TDS(ppm == mg/L) to EC(µS/cm))

Measuring Range: 0 ~ 1562.5µS/cm

Accuracy: ± 10% F.S. (25 ℃)

Threshold Value: 250 ~ 800µS/cm

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

from .TDS import TDS_Sensor #EC Sensor get its value through the TDS Sensor


class EC_Sensor(TDS_Sensor):
    '''
    Handles EC Sensor.
    '''
    def ec(self):
        return super().tds() / 0.64