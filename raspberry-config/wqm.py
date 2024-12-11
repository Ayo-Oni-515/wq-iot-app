#!/usr/bin/env python3

from main import quality_moitoring
import time
import lcd
import firestore

import RPi.GPIO as GPIO

#GPIO cleanup from previous state(Automatically resets the GPIO Pins before startup)
GPIO.cleanup()

while True:
    #Obtains parameters 
    data = quality_moitoring()
    firestore.upload_to_firestore(
        data['ph'],
        data['tds'],
        data['ec'],
        data['turbidity'],
        data['temperature'],
        data['water level'],
        data['wqi']        
    )
    # lcd.display(data)
    time.sleep(900) #15 minutes delay time

