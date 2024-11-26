import firebase_admin
from firebase_admin import credentials, firestore

try:
    # Initialize Firebase
    cred = credentials.Certificate("firebase-services-account.json")
    firebase_admin.initialize_app(cred)

    # Accessing Firestore
    db = firestore.client()

    # Update data for water quality parameters
    water_parameters = db.collection("waterParameters").document("ko9ATHykCZnw3RxkVzpP")
    water_parameters.update({
        "do": 15,
        "ec": 600,
        "hardness": 250,
        "ph": 7.68,
        "salinity": 18,
        "temperature": 25,
        "turbidity": 3,
        "wqi": 23.9,
    })

    # Update data for Water Level
    pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
    pump_control.update({
        "water_level": 70.50,
    })

    # Read pump control data
    doc = pump_control.get()
    if doc.exists:
        doc = doc.to_dict()
        print(f"Document data: {doc['mode'], doc['switch']}")
        print(doc)
    else:
        print("No such document!")
except Exception as e:
    print(f"Error: {e}")

