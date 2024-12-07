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

Threshold Value: min_level = , max_level =

"""
#Checks the level of water left in the tank
#Signal the Relay to turn ON the Pump
#Signal the Relay to turn OFF the Pump

import time
from .ultrasonic import Ultrasonic_Sensor
from .control_constatnts import TANK_LOW, TANK_HIGH, TANK_US_TRIG_GPIO,\
    TANK_US_ECHO_GPIO, TANK_RELAY_GPIO


class Tank_Ultrasonic_Sensor(Ultrasonic_Sensor):
    def __init__(min_level=TANK_LOW, max_level=TANK_HIGH, trigger_pin=TANK_US_TRIG_GPIO, echo_pin=TANK_US_ECHO_GPIO, tank_gpio= TANK_RELAY_GPIO):
        super().__init__(min_level, max_level, trigger_pin, echo_pin)
        
