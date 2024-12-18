#!/usr/bin/env python3

"""
This script stores data locally as a buffer 
in the event of a network failure.
"""

import json
from datetime import datetime, timedelta, timezone

def get_local_json():
    try:
        with open('./datastore.json', 'r') as file:
            output = json.load(file)
            return output
    except Exception:
        return []


def update_local_json(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi):
    data = {'do': do, 
        'hardness': hardness, 
        'salinity': salinity, 
        'ph': ph, 
        'tds': tds, 
        'ec': ec,
        'turbidity': turbidity, 
        'temperature': temperature, 
        'water_level': water_level, 
        'wqi': wqi,
        'timestamp': datetime.now(timezone(timedelta(hours=1)))}
    
    localstore = get_local_json()

    localstore.append(data)

    try:
        with open('./datastore.json', 'w') as file:
            json.dump(localstore, file, indent=4)  # The 'indent' argument makes it pretty-printed
    except Exception:
        pass