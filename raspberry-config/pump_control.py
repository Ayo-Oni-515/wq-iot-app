#!/usr/bin/env python3

import time 
from main import pump_control
from firestore import listen_to_firestore

mode, switch = "Auto", False

try:
    # Asynchronously listen to changes to firestore.
    listener = listen_to_firestore()

    while True:
        pump_control(mode, switch)
        time.sleep(2)
finally:
    # Unsubscribe from listener.
    listener.unsubscribe()

