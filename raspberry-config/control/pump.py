#!/usr/bin/env python3

"""
Waterproof Ultrasonic Sensor: JSN-SR04T Integrated Ultrasonic Distance 
Measuring Sensor Transducer Module Waterproof.

Operating Voltage: 3.0 ~ 5.5V

Total Current: 30mA

Control Signal (Input): 
              
Type: Digital Sensor.

Unit: Meters (m)

Conversion Factor:

Trigger time: 10 microseconds

Measuring Range: 25cm ~ 4m.

Detecting Angle: 75°

Working Frequency: 40kHz

Blind Area: 20cm

Threshold Value:

"""
#Checks the level of water left in the tank
#Signal the Relay to turn ON the Pump
#Signal the Relay to turn OFF the Pump

# import RPi.GPIO as GPIO
import time
from .control_constatnts import PUMP_LOW, PUMP_HIGH, PUMP_US_TRIG_GPIO_PIN,\
    PUMP_US_ECHO_GPIO_PIN, PUMP_RELAY_GPIO_PIN


def Pump():
    # GPIO setup
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(PUMP_US_TRIG_GPIO_PIN, GPIO.OUT)
    GPIO.setup(PUMP_US_ECHO_GPIO_PIN, GPIO.IN)

    # Trigger the sensor
    GPIO.output(PUMP_US_TRIG_GPIO_PIN, True)
    time.sleep(0.00001)  # 10 microseconds pulse
    GPIO.output(PUMP_US_TRIG_GPIO_PIN, False)

    # Measure the time for echo to return
    while GPIO.input(PUMP_US_ECHO_GPIO_PIN) == 0:
        start_time = time.time()

    while GPIO.input(PUMP_US_ECHO_GPIO_PIN) == 1:
        end_time = time.time()

    # Calculate distance
    duration = end_time - start_time
    distance = (duration * 34300) / 2  # Speed of sound = 343 m/s
    return distance

def test():
    return "pump is active!!!"