#!/usr/bin/env python3

"""
Turbidity Sensor: DFRobot Gravity Analog Turbidity Sensor.

Operating Voltage: 5.0V

Operating Current: 40mA (MAX)

Analog Output: 0.0 ~ 4.5V (>3.3v reference)

Control Voltage (Input) : 
                
Type: Analog Sensor.

Unit: NTU (Nephelometric Turbidity Unit)

Conversion Factor:

Threshold Value: 0 ~ 5NTU

Interfacing Protocol: SPI (Serial Peripheral Interface)

**Requires ADC(MCP3008) -> 10-bit 
"""

from .sensor import Analog_Sensor
from .sensor_constants import TURBIDITY_MCP3008_ADC_PIN, TURBIDITY_LOW, TURBIDITY_HIGH

class Turbidity_Sensor(Analog_Sensor):
    '''
    Handles Turbidity Sensor.
    '''
    def __init__(self, channel=TURBIDITY_MCP3008_ADC_PIN, low_threshold=TURBIDITY_LOW, high_threshold =TURBIDITY_HIGH):
        super().__init__(channel)


    def __str__(self):
        return "Turbidity Sensor Active!!!"


    def turbidity_calculation(self):
        adc_value = self.read_adc()


# SPI setup
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



# import spidev
# import time

