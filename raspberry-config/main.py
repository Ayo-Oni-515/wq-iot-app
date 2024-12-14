#!/usr/bin/env python3

"""
This is the main python script for the functions of the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
operation and control.
"""

#Importing Essential Packages
import sensors as snse
import control as ctrl
import errors as err
import ccmewqi as qi

#Sensor GPIO Initialization (Done from packages)

def pump_control(mode="Auto"):
    # Initialize Tank Sensor
    tank_ultrasonic_sensor = ctrl.tank.Tank_Ultrasonic_Sensor()

    #Fetch from firestore or be triggered by flutter application initialization
    switch = True 

    if mode == "Auto":
        #Check tank water level
        level = tank_ultrasonic_sensor.water_level()
        if level >= tank_ultrasonic_sensor.min_level:
            tank_ultrasonic_sensor.fill_tank()
    elif mode == "Manual":
        # Apply remote control from the app
        tank_ultrasonic_sensor.auto_mode(switch)

        
# Run this every 15 minutes
def quality_moitoring():
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


    return {'do': do, 'hardness': h_ardness, 'salinity': s_alinity, 'ph': ph, 'tds': tds, 'ec': ec, \
            'turbidity': turbidity, 'temperature': temperature, 'water level': water_level, 'wqi': wqi}


def dissolved_oxygen(temperature):
    do = (14.6 - 0.41 * temperature) / (1 + 0.00022 * temperature)
    return do


def hardness(tds):
    return tds * 0.7


def salinity(tds):
    return tds * 0.001