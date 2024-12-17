#!/usr/bin/env python3

"""
This script is run on startup to ensure that the GPIO pins are rest everytime.
"""

import RPi.GPIO as GPIO

GPIO.cleanup()