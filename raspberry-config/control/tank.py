#!/usr/bin/env python3

"""
This script handles the tank's ultrasonic sensor and pump control. 
"""

"""
Waterproof Ultrasonic Sensor: JSN-SR04T Integrated Ultrasonic Distance 
Measuring Sensor Transducer Module Waterproof.

Operating Voltage: 3.0 ~ 5.5V

Total Current: 30mA 
              
Type: Digital Sensor.

Unit: centimetres (cm)

Trigger time: 10 microseconds

Measuring Range: 25cm ~ 4m.

Detecting Angle: 75°

Working Frequency: 40kHz

Blind Area: 20cm

Threshold Value: mininimum level = 180cm, maximum level = 30cm

"""
#Checks the level of water left in the tank
#Signal the Relay to turn ON the Pump if below threshold
#Signal the Relay to turn OFF the Pump if at or above threshold

import time
import RPi.GPIO as GPIO
from .ultrasonic import Ultrasonic_Sensor
from .control_constants import TANK_LOW, TANK_HIGH, TANK_US_TRIG_GPIO,\
    TANK_US_ECHO_GPIO, TANK_RELAY_GPIO


class Tank_Ultrasonic_Sensor(Ultrasonic_Sensor):
    def __init__(self, min_level=TANK_LOW, max_level=TANK_HIGH, trigger_pin=TANK_US_TRIG_GPIO,\
                 echo_pin=TANK_US_ECHO_GPIO, tank_gpio= TANK_RELAY_GPIO):
        super().__init__(min_level, max_level, trigger_pin, echo_pin)
        self.min_level = min_level
        self.max_level = max_level
        self.tank_gpio = tank_gpio

        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.tank_gpio, GPIO.OUT)
        # Relay is active-low
        #GPIO.HIGH = turn off relay
        #GPIO.LOW = turn on relay
        GPIO.output(self.tank_gpio, GPIO.LOW) #GPIO.HIGH


    def fill_tank(self):
        # Turn pump on if tank water level is low
        GPIO.output(self.tank_gpio, GPIO.HIGH) #GPIO.LOW
        while self.water_level() > self.max_level:
            time.sleep(5)
        # Turn pump off the tank
        GPIO.output(self.tank_gpio, GPIO.LOW) #GPIO.HIGH

    
    def auto_mode(self, switch):
        if switch:
            if self.water_level() > self.max_level:
                GPIO.output(self.tank_gpio, GPIO.HIGH) #GPIO.LOW
            elif self.water_level() <= self.max_level:
                GPIO.output(self.tank_gpio, GPIO.LOW) #GPIO.HIGH
        else:
            GPIO.output(self.tank_gpio, GPIO.LOW) #GPIO.HIGH