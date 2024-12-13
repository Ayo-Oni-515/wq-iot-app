#!/usr/bin/env python3

from datetime import datetime, timedelta
import time
import firebase_admin
from firebase_admin import credentials, firestore
from localstore import update_local_json_aggregate

# Initialize Firebase
cred = credentials.Certificate("firebase-services-account.json")
firebase_admin.initialize_app(cred)

# Accessing Firestore
db = firestore.client()

def upload_to_firestore(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi):
    try:
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
            "timestamp": datetime.now() - timedelta(hours=1), #Makes sure the time is set to UTC+1 Nigerian Time
            "turbidity": turbidity,
            "water_level": water_level, #obtain from tank water_level
            "wqi": wqi, #obtain from ccmewqi
            })

        # Read pump control data (store this in a separate function)
    except Exception as e:
        # update_local_json_aggregate(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi)
        pass
        


def get_from_firestore():
    pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
    doc = pump_control.get()
    if doc.exists:
        doc = doc.to_dict()
        mode = doc['mode']
        switch = doc['switch']
        # print(f"Document data: {doc['mode'], doc['switch']}")
        return {'mode': mode, 'switch': switch}
    else:
        return None


