import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
cred = credentials.Certificate("firebase-services-account.json")
firebase_admin.initialize_app(cred)

# Access Firestore
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

pump_control = db.collection("pumpControl").document("fCgyfcht2wPkn1TJ05KE")
pump_control.update({
    "water_level": 70.34,
})

# Read data
doc = pump_control.get()
if doc.exists:
    doc = doc.to_dict()
    print(f"Document data: {doc['mode'], doc['switch']}")
    print(doc)
else:
    print("No such document!")


