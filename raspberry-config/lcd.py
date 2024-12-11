#!/usr/bin/env python3

"""
This script handles the LCD screen meant to display parameter values. 
"""

import time
import raspi_temp #Displays pi's temperature on the second line permanantly.
from RPLCD.i2c import CharLCD

def display(data):
    # Initialize the LCD (replace '0x27' with your I2C address)
    lcd = CharLCD('PCF8574', 0x27)

    for parameter, value in data.items():
        lcd.cursor_pos = (0, 0)  # Set cursor to row 0, column 0
        lcd.write_string(f"{parameter}: {value}")
        time.sleep(5) #5 second delay
        lcd.clear()