#!/usr/bin/env python3

"""
This script handles the test kit's operation. 
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

#Check test kit water level 
#Open inlet valve, If full close inlet valve
#Take water Parameters
#Open Outlet valve until empty **(Avoiding reflow: How high can water rise in a pipe under S.T.P)

import time
import RPi.GPIO as GPIO
from .ultrasonic import Ultrasonic_Sensor
from .control_constants import TEST_KIT_LOW, TEST_KIT_HIGH, TEST_KIT_US_TRIG_GPIO,\
    TEST_KIT_US_ECHO_GPIO, INLET_VALVE_RELAY_GPIO, OUTLET_VALVE_RELAY_GPIO


class Test_Kit_Ultrasonic_Sensor(Ultrasonic_Sensor):
    def __init__(self, min_level=TEST_KIT_LOW, max_level=TEST_KIT_HIGH,\
                 trigger_pin=TEST_KIT_US_TRIG_GPIO, echo_pin=TEST_KIT_US_ECHO_GPIO,\
                inlet_valve=INLET_VALVE_RELAY_GPIO, outlet_valve=OUTLET_VALVE_RELAY_GPIO):
        super().__init__(min_level, max_level, trigger_pin, echo_pin)
        self.inlet_valve = inlet_valve
        self.outlet_valve = outlet_valve
        self.min_level = min_level
        self.max_level = max_level

        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.inlet_valve, GPIO.OUT)
        GPIO.setup(self.outlet_valve, GPIO.OUT)
        # Relay is active-low
        #GPIO.HIGH = turn off relay
        #GPIO.LOW = turn on relay
        GPIO.output(self.inlet_valve, GPIO.HIGH) #GPIO.HIGH
        GPIO.output(self.outlet_valve, GPIO.HIGH) #GPIO.HIGH

        
    def fill_test_kit(self):
        # Opens the inlet valve if the test kit water level is low
        GPIO.output(self.inlet_valve, GPIO.LOW) #GPIO.LOW
        while self.water_level() > self.max_level:
            time.sleep(1)
        # Closes the inlet valve
        GPIO.output(self.inlet_valve, GPIO.HIGH) #GPIO.HIGH

    
    def empty_test_kit(self):
        # Opens the outlet valve if the test kit water level is full
        GPIO.output(self.outlet_valve, GPIO.LOW) #GPIO.LOW
        while self.water_level() < self.min_level:    
            time.sleep(1)
        GPIO.output(self.outlet_valve, GPIO.HIGH) #GPIO.HIGH

