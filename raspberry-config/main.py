#!/usr/bin/env python3

"""
This is the main python script for the functions of the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
operation and control.
"""
import time
import RPi.GPIO as GPIO

#Importing Essential Packages
import sensors as snse
import control as ctrl
import errors as err
import ccmewqi as qi

#Sensor GPIO Initialization (Done from packages)

def pump_control(mode="Auto", switch=False):
    try:
        # Initialize Tank Sensor
        tank_ultrasonic_sensor = ctrl.tank.Tank_Ultrasonic_Sensor()
        while True:
            if mode == "Auto":
                #Check tank water level
                level = tank_ultrasonic_sensor.water_level()
                if level >= tank_ultrasonic_sensor.min_level:
                    tank_ultrasonic_sensor.fill_tank()
                time.sleep(2)
            elif mode == "Manual":
                # Apply remote control from the app
                tank_ultrasonic_sensor.auto_mode(switch)
            else:
                break
    finally:
        GPIO.cleanup()
        
        
# Runs every 20 minutes through cron
def quality_monitoring():
    try:
        """
        Aggregates processes involving water quality moitoring in one script.
        """
        # Initialize Tank Ultrasonic Sensor
        tank_ultrasonic_sensor = ctrl.tank.Tank_Ultrasonic_Sensor()

        # Initialize Test Kit Ultrasonic Sensor
        test_kit_ultrasonic_sensor = ctrl.test_kit.Test_Kit_Ultrasonic_Sensor()

        #Check test kit water level and fill it if below threshold
        level = test_kit_ultrasonic_sensor.water_level()

        if level >= test_kit_ultrasonic_sensor.min_level:
            test_kit_ultrasonic_sensor.fill_test_kit()

        # Initialize Water Quality Sensors and take readings
        try:
            ph_sensor = snse.pH.PH_Sensor()
            ph = ph_sensor.ph()
        except:
            #Set default values in the event of failure (easy detection)
            ph = -1

        try:
            tds_sensor = snse.TDS.TDS_Sensor()
            tds = tds_sensor.tds()
        except:
            #Set default values in the event of failure (easy detection)
            tds = -1
            
        try:
            ec_sensor = snse.EC.EC_Sensor()
            ec = ec_sensor.ec()
        except:
            #Set default values in the event of failure (easy detection)
            ec = -1

        try:
            turbidity_sensor = snse.turbidity.Turbidity_Sensor()
            turbidity = turbidity_sensor.turbidity()
        except:
            #Set default values in the event of failure (easy detection)
            turbidity = -1

        try:
            temperature_sensor = snse.temperature.Temperature_Sensor()
            temperature = temperature_sensor.temperature()
        except:
            #Set default values in the event of failure (easy detection)
            temperature = -1

        # Empty test kit after testing
        test_kit_ultrasonic_sensor.empty_test_kit()

        try:
            #Obtain tank water level
            water_level = tank_ultrasonic_sensor.water_level_percentage()
        except:
            #Set default values in the event of failure (easy detection)
            water_level = -1

        try:
            #Evaluate water quality index from obtained parameters
            wqi = qi.ccmewqi(ph, turbidity, ec, tds, temperature)
        except:
            #Set default values in the event of failure (easy detection)
            wqi = -1

        # Derived parameters
        try:
            do = dissolved_oxygen(temperature)
        except:
            #Set default values in the event of failure (easy detection)\
            do = -1

        try:
            h_ardness = hardness(tds)
        except:
            #Set default values in the event of failure (easy detection)
            h_ardness = -1

        try:
            s_alinity = salinity(tds)
        except:
            #Set default values in the event of failure (easy detection)
            s_alinity = -1


        return {'do': round(do, 2), 
                'hardness': round(h_ardness, 2), 
                'salinity': round(s_alinity, 2), 
                'ph': round(ph, 2), 
                'tds': round(tds, 2), 
                'ec': round(ec, 2), 
                'turbidity': round(turbidity, 2), 
                'temperature': round(temperature, 2),
                'water_level': round(water_level, 2), 
                'wqi': round(wqi, 2)}
    finally:
        GPIO.cleanup()

def dissolved_oxygen(temperature):
    if temperature == -1:
        return -1
    do = (14.6 - 0.41 * temperature) / (1 + 0.00022 * temperature)
    return do


def hardness(tds):
    if tds == -1:
        return -1
    return tds * 0.7


def salinity(tds):
    if tds == -1:
        return -1
    return tds * 0.001