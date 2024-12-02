#!/usr/bin/env python3
"""
Test Kit Containment Ultrasonic Sensor: HC-SR04 Ultrasonic Sensor Module.

Operating Voltage: 5.0V

Total Current: < 5mA

Control Signal (Input): 
              
Type: Digital Sensor.

Unit: Meters (m)

Trigger time: 10 microseconds

Conversion Factor:

Measuring Range: 2 ~ 450cm.

Effectual Angle: 15°

Measuring Angle: 30°

Working Frequency: 40kHz

Blind Area: 2-3cm

Resolution: 0.3cm

Threshold Value:

"""
#Check test kit water level 
#Open inlet valve
#If full close inlet valve
#Take water Parameters
# Open Outlet valve until empty **(Avoiding reflow: How high can water rise in a pipe)

# import RPi.GPIO as GPIO
import time
from .control_constatnts import TEST_KIT_GPIO, TEST_KIT_LOW,\
    TEST_KIT_HIGH, TEST_KIT_US_TRIG_GPIO, TEST_KIT_US_ECHO_GPIO,\
    TEST_KIT_MIN_DISTANCE, TEST_KIT_MAX_DISTANCE

def test_kit():
    # GPIO setup
    # GPIO.setmode(GPIO.BCM)
    # GPIO.setup(TEST_KIT_US_TRIG_GPIO, GPIO.OUT)
    # GPIO.setup(TEST_KIT_US_ECHO_GPIO, GPIO.IN)

    # Trigger the sensor
    # GPIO.output(TEST_KIT_US_TRIG_GPIO, False)
    # time.sleep(0.000002) # 2 microseconds delay
    # GPIO.output(TEST_KIT_US_TRIG_GPIO, True)
    # time.sleep(0.00001)  # 10 microseconds pulse
    # GPIO.output(TEST_KIT_US_TRIG_GPIO, False)

    # Measure the time for echo to return
    while GPIO.input(TEST_KIT_US_ECHO_GPIO) == 0:
        start_time = time.time()

    while GPIO.input(TEST_KIT_US_ECHO_GPIO) == 1:
        end_time = time.time()

    # Calculate distance
    duration = end_time - start_time
    distance = (duration * 34300) / 2  # Speed of sound = 343 m/s
    #         return distance

def test():
    return "test kit is active!!!"