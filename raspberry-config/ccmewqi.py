#!/usr/bin/env python3

"""
This is the python script for the project's selected wqi model (CCMEWQI).
It computes the water quality index based on the obtained parameter.
"""

# def ccmewqi(ph, turbidiy, ec, tds, temperature):
#     scope_factor = 0
#     frequency_factor = 0
#     amplitude_factor = 0
#     excursion = 0
#     total_number_of_tests = 0
#     nse = excursion / total_number_of_tests
#     wqi = 100 - ((((scope_factor ** 2) + (frequency_factor ** 2) + (amplitude_factor ** 2)) ** 0.5) / 1.732)
#     return wqi


import RPi.GPIO as GPIO
import time

# Define GPIO pins
TRIG_PIN = 23  # Trigger pin
ECHO_PIN = 24  # Echo pin

def setup():
    GPIO.setmode(GPIO.BCM)  # Use Broadcom GPIO numbering
    GPIO.setup(TRIG_PIN, GPIO.OUT)
    GPIO.setup(ECHO_PIN, GPIO.IN)
    GPIO.output(TRIG_PIN, False)

def measure_distance():
    # Trigger the sensor
    GPIO.output(TRIG_PIN, True)
    time.sleep(0.00001)  # 10µs pulse
    GPIO.output(TRIG_PIN, False)

    # Wait for the echo
    while GPIO.input(ECHO_PIN) == 0:
        start_time = time.time()

    while GPIO.input(ECHO_PIN) == 1:
        end_time = time.time()

    # Calculate the distance
    elapsed_time = end_time - start_time
    distance = (elapsed_time * 34300) / 2  # Speed of sound: 343 m/s
    return distance

def cleanup():
    GPIO.cleanup()

if __name__ == "__main__":
    try:
        setup()
        while True:
            dist = measure_distance()
            print(f"Distance: {dist:.2f} cm")
            time.sleep(1)  # Delay between measurements
    except KeyboardInterrupt:
        print("Measurement stopped by user.")
    finally:
        cleanup()
