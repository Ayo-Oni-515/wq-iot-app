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

    #Check test kit water level
    level = test_kit_ultrasonic_sensor.water_level()

    if level >= test_kit_ultrasonic_sensor.min_level:
        test_kit_ultrasonic_sensor.fill_test_kit()

    # Initialize Water Quality Sensors and take readings
    ph_sensor = snse.pH.PH_Sensor()
    ph = ph_sensor.ph()

    tds_sensor = snse.TDS.TDS_Sensor()
    tds = tds_sensor.tds()

    ec_sensor = snse.EC.EC_Sensor()
    ec = ec_sensor.ec()

    turbidity_sensor = snse.turbidity.Turbidity_Sensor()
    turbidity = turbidity_sensor.turbidity()

    temperature_sensor = snse.temperature.Temperature_Sensor()
    temperature = temperature_sensor.temperature()

    # Empty test kit after testing
    test_kit_ultrasonic_sensor.empty_test_kit()

    #Obtain tank water level
    water_level = tank_ultrasonic_sensor.water_level_percentage()

    #Evaluate water quality index from obtained parameters
    wqi = qi.ccmewqi(ph, turbidity, ec, tds, temperature)

    return {'ph': ph, 'tds': tds, 'ec': ec, 'turbidity': turbidity, 'temperature': temperature, 'water level': water_level, 'wqi': wqi}
