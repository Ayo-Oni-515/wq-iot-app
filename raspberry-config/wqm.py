#!/usr/bin/env python3

from main import quality_monitoring
from localstore import get_local_json, update_local_json
from firestore import update_realtime_firestore_data, update_firestore_data

#carries out quality monitoring procedure 
data = quality_monitoring()

#Checks local storage for any data
store = get_local_json()

#Check localstore if any data is present, then upload to firestore
if len(store) > 0:
    for i in range(len(store)):
        update_firestore_data(
            store[i]['do'],
            store[i]['hardness'],
            store[i]['salinity'],
            store[i]['ph'],
            store[i]['tds'],
            store[i]['ec'],
            store[i]['turbidity'],
            store[i]['temperature'],
            store[i]['water_level'],
            store[i]['wqi'],
            store[i]['timestamp'],            
        )
    store.clear()

#Uplaod to firestore if no error
try:
    update_realtime_firestore_data(
        data['do'],
        data['hardness'],
        data['salinity'],
        data['ph'],
        data['tds'],
        data['ec'],
        data['turbidity'],
        data['temperature'],
        data['water_level'],
        data['wqi']        
    )
    
    update_firestore_data(
        data['do'],
        data['hardness'],
        data['salinity'],
        data['ph'],
        data['tds'],
        data['ec'],
        data['turbidity'],
        data['temperature'],
        data['water_level'],
        data['wqi']
    )
except:
    #Store in local json file if any error occurs
    update_local_json(
        data['do'],
        data['hardness'],
        data['salinity'],
        data['ph'],
        data['tds'],
        data['ec'],
        data['turbidity'],
        data['temperature'],
        data['water_level'],
        data['wqi'])

# time.sleep(900) #20 minutes delay time (Delay handled by crontab)