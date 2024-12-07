#!/usr/bin/env python3

"""
This script handles the test kit's operation. 
"""

"""
Test Kit Containment Ultrasonic Sensor: HC-SR04 Ultrasonic Sensor Module.

Operating Voltage: 5.0V

Total Current: < 5mA
              
Type: Digital Sensor.

Unit: centimetre (cm).

Trigger time: 10 microseconds

Measuring Range: 2 ~ 450cm.

Effectual Angle: 15°

Measuring Angle: 30°

Working Frequency: 40kHz

Blind Area: 2-3cm

Resolution: 0.3cm

Threshold Value: min_level = , max_level =

"""
#Check test kit water level 
#Open inlet valve
#If full close inlet valve
#Take water Parameters
# Open Outlet valve until empty **(Avoiding reflow: How high can water rise in a pipe)

import time
from .ultrasonic import Ultrasonic_Sensor
from .control_constatnts import TEST_KIT_LOW, TEST_KIT_HIGH, TEST_KIT_US_TRIG_GPIO,\
    TEST_KIT_US_ECHO_GPIO, INLET_VALVE_RELAY_GPIO, OUTLET_VALVE_RELAY_GPIO


class Test_Kit_Ultrasonic_Sensor(Ultrasonic_Sensor):
    def __init__(min_level=TEST_KIT_LOW, max_level=TEST_KIT_HIGH,\
                 trigger_pin=TEST_KIT_US_TRIG_GPIO, echo_pin=TEST_KIT_US_ECHO_GPIO,\
                inlet_valve=INLET_VALVE_RELAY_GPIO, oulet_valve=OUTLET_VALVE_RELAY_GPIO):
        super().__init__(min_level, max_level, trigger_pin, echo_pin)