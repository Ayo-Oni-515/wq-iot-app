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

Threshold Value:

**It can be powered directly by the raspberry pi.
Adapter module is equipped with a pull-up resistor, and 
directly connects to the GPIO of the Raspberry Pi without an 
external resistor.

Interfacing Protocol: 1-Wire Protocol.

**Enable the 1-wire protocol.
"""

def temperature_post(args):
    '''
    Meant to perform Power On Self Test (POST)
    '''
    pass


def temperature(args):
    pass



#From ChatGPT
# from w1thermsensor import W1ThermSensor

# # Initialize the sensor
# sensor = W1ThermSensor()

# # Read temperature
# temperature_celsius = sensor.get_temperature()
# temperature_fahrenheit = sensor.get_temperature(W1ThermSensor.DEGREES_F)

# print(f"Temperature: {temperature_celsius:.2f}°C / {temperature_fahrenheit:.2f}°F")
