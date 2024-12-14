#!/usr/bin/env python3

import spidev
from w1thermsensor import W1ThermSensor
import time

class Analog_Sensor_Error(Exception):
    """Custom exception for Analog Sensor Error."""
    pass


class Digital_Sensor_Error(Exception):
    """Custom exception for Digital Sensor Error."""
    pass


class Analog_Sensor:
    '''
    Handles Analog sensors using SPI communication protocol.
    '''
    def __init__(self, reference_voltage = 3.3, bus=0, device=0, max_speed=1350000, channel=0):
        self.reference_voltage = reference_voltage
        self.channel = channel
        self.readings = []
        try:
            time.sleep(5) #30 second delay for sensor stabilization
            self.spi = spidev.SpiDev()
            self.spi.open(bus, device) # Open spi communication on bus 0, device 0
            self.spi.max_speed_hz = max_speed #Sets communication speed between master(raspi) and slave(ADC)
        except Exception as e:
            raise Analog_Sensor_Error(f"SPI Error: {e}")


    def read_digital(self): 
        while len(self.readings) < 20:
            self.adc = self.spi.xfer2([1, (8 + self.channel) << 4, 0]) #Sends signal to the slave(ADC)
            self.data = ((self.adc[1] & 3) << 8) + self.adc[2] #Response gotten from slave(ADC) => Digital Signal
            self.readings.append(self.data)
        average = sum(self.readings) / len(self.readings)
        self.readings.clear()
        self.close()
        return average
    

    def read_voltage(self): #Converts a 10-bit digital Value to Voltage (Required for calibrated sensors)
        return self.read_digital() * (self.reference_voltage / 1023)
    
    
    def close(self):
        try:
            self.spi.close()
        except Exception as e:
            raise Analog_Sensor_Error(f"SPI Error: {e}")


class Digital_Sensor:
    '''
    Handles the only digital sensor for water parameters available for this project (Temperature sensor)
    '''
    def __init__(self):
        self.readings = []
        try:
            self.temp_sensor = W1ThermSensor()
            pass
        except Exception as e:
            raise Digital_Sensor_Error(f"W1ThermSensor Error: {e}")


    def read_digital(self):
        while len(self.readings) < 20:
            self.celsius_temp = self.temp_sensor.get_temperature()
            self.readings.append(self.celsius_temp)
        average = sum(self.readings) / len(self.readings)
        self.readings.clear()
        return average