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

from sensor import Analog_Sensor
from sensor_constants import TDS_MCP3008_ADC_PIN

class TDS_Sensor(Analog_Sensor):
    def __init__(self, bus=0, device=0, max_speed=1350000, channel=TDS_MCP3008_ADC_PIN):
        super().__init__(bus, device, max_speed, channel)

    def tds_post(self):
        '''
        Meant to perform Power On Self Test (POST)
        '''
        pass


    def tds_calculation(self):
        adc_value = self.read_adc()


tds = TDS_Sensor()


# import spidev
# import time

# # SPI setup
# spi = spidev.SpiDev()
# spi.open(0, 0)  # Open on bus 0, device 0
# spi.max_speed_hz = 1350000

# def read_adc(channel):
#     adc = spi.xfer2([1, (8 + channel) << 4, 0])
#     data = ((adc[1] & 3) << 8) + adc[2]
#     return data

# def calculate_voltage(adc_value):
#     return adc_value * (3.3 / 1023.0)  # For 3.3V reference

# def calculate_turbidity(voltage):
#     # Example linear approximation
#     # You may need to adjust these based on calibration data
#     return 3000 - (voltage * 1000)

# while True:
#     adc_value = read_adc(0)  # Channel 0 for turbidity sensor
#     voltage = calculate_voltage(adc_value)
#     turbidity = calculate_turbidity(voltage)
    
#     print(f"Turbidity: {turbidity} NTU")
#     time.sleep(1)
