#!/usr/bin/env python3

"""
This is the main python script for the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
control, and so on. 
"""

#Importing Python Packages
import time

# Importing Raspberry pi packages
# import RPi.GPIO as GPIO
# import smbus #(For I2C) => LCD Screen


#Importing Essential Packages
import sensors as sns
import control as ctrl
import errors as err


#GPIO cleanup from previous state (Automatically resets the GPIO Pins before startup)
# GPIO.cleanup()


#GPIO setup
# GPIO.setmode(GPIO.BCM)


#SENSORS GPIO Initialization
# GPIO.setup(EC_GPIO_PIN, GPIO.IN) (Not needed)
# GPIO.setup(PH_GPIO_PIN, GPIO.IN)
# GPIO.setup(TDS_GPIO_PIN, GPIO.IN)
# GPIO.setup(TEMPERATURE_GPIO_PIN, GPIO.IN)
# GPIO.setup(TURBIDITY_GPIO_PIN, GPIO.IN)


#Intefacing should be done using SPI 

#CONTROL GPIO Initialization
# GPIO.setup(PUMP_GPIO, GPIO.IN)
# GPIO.setup(TEST_KIT_GPIO, GPIO.IN)
# GPIO.setup(VALVES_GPIO, GPIO.IN)

# print(EC.value)
# print(pump.pump_threshold)
# print(PH_GPIO)


# GPIO.cleanup()
print(ctrl.valves.test())