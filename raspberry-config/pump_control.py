#!/usr/bin/env python3

import RPi.GPIO as GPIO

#GPIO cleanup from previous state(Automatically resets the GPIO Pins before startup)
GPIO.cleanup()

from main import pump_control

while True:
    pump_control()

GPIO.cleanup()