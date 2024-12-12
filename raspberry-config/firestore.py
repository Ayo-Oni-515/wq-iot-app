#!/usr/bin/env python3

from datetime import datetime, timedelta
import time
import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
cred = credentials.Certificate("firebase-services-account.json")
firebase_admin.initialize_app(cred)

# Accessing Firestore
db = firestore.client()

def upload_to_firestore(ph, tds, ec, turbidity, temperature, water_level, wqi):
    try:
        # Update data for water quality parameters
        water_parameters = db.collection("waterParameters").document("ko9ATHykCZnw3RxkVzpP")
        water_parameters.update({
            "do": dissolved_oxygen(temperature), #obtain
            "ec": ec,
            "hardness": hardness(tds), #obtain
            "ph": ph,
            "salinity": salinity(tds), #obtain
            "tds": tds,
            "temperature": temperature,
            "turbidity": turbidity,
            "wqi": wqi, #obtain from ccmewqi
        })

        # Update data for Water Level
        pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
        pump_control.update({
            "water_level": water_level, #obtain from tank water_level()
        })

        # Add data to datastore
        datastore = db.collection("datastore")
        datastore.add({
            "do": dissolved_oxygen(temperature), #obtain
            "ec": ec,
            "hardness": hardness(tds), #obtain
            "ph": ph,
            "salinity": salinity(tds), #obtain
            "tds": tds,
            "temperature": temperature,
            "timestamp": datetime.now() - timedelta(hours=1), #Makes sure the time is set to UTC+1 Nigerian Time
            "turbidity": turbidity,
            "water_level": water_level, #obtain from tank water_level
            "wqi": wqi, #obtain from ccmewqi
            })

        # Read pump control data (store this in a separate function)
    except Exception as e:
        print(f"Error: {e}")


def get_from_firestore():
    pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
    doc = pump_control.get()
    if doc.exists:
        doc = doc.to_dict()
        print(f"Document data: {doc['mode'], doc['switch']}")
        print(doc)
    else:
        print("No such document!")


def dissolved_oxygen(temperature):
    do = (14.6 - 0.41 * temperature) / (1 + 0.00022 * temperature)
    return do


def hardness(tds):
    return tds * 0.7


def salinity(tds):
    return tds * 0.001