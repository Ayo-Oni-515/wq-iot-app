import firebase_admin
from firebase_admin import credentials, firestore

try:
    # Initialize Firebase
    cred = credentials.Certificate("firebase-services-account.json")
    firebase_admin.initialize_app(cred)

    # Access Firestore
    db = firestore.client()

    # Update water quality parameters
    water_parameters_ref = db.collection("waterParameters").document("ko9ATHykCZnw3RxkVzpP")
    water_parameters_ref.update({
        "do": 15,
        "ec": 600,
        "hardness": 250,
        "ph": 7.68,
        "salinity": 18,
        "temperature": 25,
        "turbidity": 3,
        "wqi": 23.9,
    })

    # Update pump control parameters
    pump_control_ref = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
    pump_control_ref.update({
        "water_level": 70.34,
    })

    # Read pump control data
    doc = pump_control_ref.get()
    if doc.exists:
        pump_control_data = doc.to_dict()
        # print(f"Document data: {pump_control_data['mode'], pump_control_data['switch']}")
        print(pump_control_data)
    else:
        print("No such document!")

except Exception as e:
    print(f"An error occurred: {e}")
