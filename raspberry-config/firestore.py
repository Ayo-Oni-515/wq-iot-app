import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase
cred = credentials.Certificate("firebase-services-account.json")
firebase_admin.initialize_app(cred)

# Access Firestore
db = firestore.client()

# Add data
doc_ref = db.collection("waterParameters").document("ko9ATHykCZnw3RxkVzpP")
doc_ref.update({
    "do": 15,
    "ec": 700,
    "hardness": 200,
    "ph": 7.4,
    "salinity": 18,
    "temperature": 25,
    "turbidity": 3,
    "wqi": 23.9,
})

# Read data
doc = db.collection("sensorData").document("sensor1").get()
if doc.exists:
    print(f"Document data: {doc.to_dict()}")
else:
    print("No such document!")
