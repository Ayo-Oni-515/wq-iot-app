#!/usr/bin/env python3

# import RPi.GPIO as GPIO
import time

class Ultrasonic_Sensor_Error(Exception):
    """Custom exception for Ultrasonic Sensors."""
    pass


class Ultrasonic_Sensor:
    def __init__(self, min_level=0, max_level=0, trigger_pin=0, echo_pin=0):
        self.min_level = min_level
        self.max_level = max_level

        # GPIO setup
        # GPIO.setmode(GPIO.BCM)
        # GPIO.setup(trigger_pin, GPIO.OUT)
        # GPIO.setup(echo_pin, GPIO.IN)

        # # Trigger the sensor
        # GPIO.output(trigger_pin, False)
        # time.sleep(0.000002) # 2 microseconds delay
        # GPIO.output(trigger_pin, True)
        # time.sleep(0.00001)  # 10 microseconds pulse
        # GPIO.output(trigger_pin, False)

        # # Measure the time for echo to return
        # while GPIO.input(echo_pin) == 0:
        #     start_time = time.time()

        # while GPIO.input(echo_pin) == 1:
        #     end_time = time.time()

        # # Calculate distance
        # self.duration = end_time - start_time
        # self.distance = (self.duration * 34300) / 2  # Speed of sound = 343 m/s


    # def check_level(self):
    #     if self.distance <= self.max_level:
    #         raise Ultrasonic_Sensor_Error("Containment is full, close inlet valve")
    #     elif self.distance >= self.min_level:
    #         raise Ultrasonic_Sensor_Error("Containemt is empty, open outlet valve")
    
    # def level(self):
    #     return self.distance