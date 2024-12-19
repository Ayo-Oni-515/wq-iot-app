#!/usr/bin/env python3

import time 
from main import pump_control
from threading import Lock
from firestore import listen_to_firestore

state = {"mode": "Auto", "switch": False}

state_lock = Lock()

try:
    # Asynchronously listen to changes to firestore.
    listener = listen_to_firestore(state)
    
    while True:
        with state_lock:
            current_mode = state["mode"]
            current_switch = state["switch"]
            pump_control(current_mode, current_switch)
        time.sleep(2)
finally:
    # Unsubscribe from listener.
    listener.unsubscribe()

