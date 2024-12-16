#!/usr/bin/env python3

import RPi.GPIO as GPIO
import time

class Ultrasonic_Sensor_Error(Exception):
    """Custom exception for Ultrasonic Sensors."""
    pass


class Ultrasonic_Sensor:
    def __init__(self, min_level=0, max_level=0, trigger_pin=0, echo_pin=0):
        self.min_level = min_level
        self.max_level = max_level
        self.trigger_pin = trigger_pin
        self.echo_pin = echo_pin

        # GPIO setup
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.trigger_pin, GPIO.OUT)
        GPIO.setup(self.echo_pin, GPIO.IN)

        
    def water_level(self):
        GPIO.output(self.trigger_pin, True)
        time.sleep(0.00001)  # 10 microseconds pulse
        GPIO.output(self.trigger_pin, False)

        # Measure the time for echo to return
        while GPIO.input(self.echo_pin) == 0:
            start_time = time.time()

        while GPIO.input(self.echo_pin) == 1:
            end_time = time.time()

        # Calculate distance
        self.duration = end_time - start_time
        self.distance = (self.duration * 34300) / 2  # Speed of sound = 343 m/s

        return self.distance
    
    
    def water_level_percentage(self):
        percentage = (self.water_level() - self.min_level) / (self.max_level - self.min_level)
        if self.water_level() > self.min_level:
            return 0
        elif (percentage > 100) or (self.water_level() < self.max_level):
            # In the event the water level exceeds the threshold
            return 100
        return (percentage * 100)