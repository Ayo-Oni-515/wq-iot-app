#!/usr/bin/env python3

"""
This script handles the LCD screen meant to display parameter values. 
"""

import time
import raspi_temp #Displays pi's temperature on the second line permanantly.
from RPLCD.i2c import CharLCD

# Initialize the LCD (replace '0x27' with your I2C address)
lcd = CharLCD('PCF8574', 0x27)

def display(data):
    for parameter, value in data.items():
        message = f"{parameter}: {value}"
        lcd.clear()
        lcd.write_string(message)
        time.sleep(5) #5 second delay
        lcd.clear()