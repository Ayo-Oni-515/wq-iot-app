#!/usr/bin/env python3

from datetime import datetime, timedelta, timezone
import firebase_admin
from firebase_admin import credentials, firestore

#initialize firebase
cred = credentials.Certificate("firebase-services-account.json")
firebase_admin.initialize_app(cred)

#accessing firestore
db = firestore.client()

#Easily Accessible real time data
def update_realtime_firestore_data(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi):
    # Update data for water quality parameters
    water_parameters = db.collection("waterParameters").document("ko9ATHykCZnw3RxkVzpP")
    water_parameters.update({
        "do": do, #obtain
        "ec": ec,
        "hardness": hardness, #obtain
        "ph": ph,
        "salinity": salinity, #obtain
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


#Data collection over time
def update_firestore_data(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi, timestamp=datetime.now(timezone(timedelta(hours=1)))):
    # Add data to datastore
    datastore = db.collection("datastore")
    datastore.add({
        "do": do, #obtain
        "ec": ec,
        "hardness": hardness, #obtain
        "ph": ph,
        "salinity": salinity, #obtain
        "tds": tds,
        "temperature": temperature,
        "timestamp": timestamp, #Makes sure the time is set to UTC+1 Nigerian Time
        "turbidity": turbidity,
        "water_level": water_level, #obtain from tank water_level
        "wqi": wqi, #obtain from ccmewqi
        })


#Receives a stream of data from firestore
def listen_to_firestore():
    def on_snapshot(doc_snapshot, changes, read_time):
        """
        Callback function triggered whenever the document is updated.
        """
        global mode, switch
        for doc in doc_snapshot:
            if doc.exists:
                doc_data = doc.to_dict()
                mode = doc_data['mode']
                switch = doc_data['switch']

    pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
    pump_snapshot = pump_control.on_snapshot(on_snapshot)
    return pump_snapshot