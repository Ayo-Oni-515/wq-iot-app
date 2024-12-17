#!/usr/bin/env python3

from main import pump_control
from firestore import listen_to_firestore

mode, switch = "Auto", False

listener = listen_to_firestore()

pump_control(mode, switch)

listener.unsubscribe()