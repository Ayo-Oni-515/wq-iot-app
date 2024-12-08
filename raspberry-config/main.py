#!/usr/bin/env python3

"""
This is the main python script for the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
operation and control.
"""

#Importing Python Packages
import time
import RPi.GPIO as GPIO

#Importing Essential Packages
import sensors as snse
import control as ctrl
import errors as err

#GPIO cleanup from previous state(Automatically resets the GPIO Pins before startup)
GPIO.cleanup()

#Sensor GPIO Initialization (Se from packages)

def pump_control():
    # Initialize Tank Sensor
    tank_ultrasonic_sensor = ctrl.tank.Tank_Ultrasonic_Sensor()


def quality_moitoring():
    # Initialize Water Quality Sensors
    ph_sensor = snse.pH.PH_Sensor()
    tds_sensor = snse.TDS.TDS_Sensor()
    ec_sensor = snse.EC.EC_Sensor()
    turbidity_sensor = snse.turbidity.Turbidity_Sensor()
    temperature_sensor = snse.temperature.Temperature_Sensor()

    # Initialize Test Kit Ultrasonic Sensor
    test_kit_ultrasonic_sensor = ctrl.test_kit.Test_Kit_Ultrasonic_Sensor()


GPIO.cleanup()