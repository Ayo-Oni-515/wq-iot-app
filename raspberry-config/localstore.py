#!/usr/bin/env python3

"""
This script stores data locally as a buffer in the event of a 
network failure and for displaying data on the LCD screen.
"""

import json

# add timestamp
def update_local_json(do, hardness, salinity, ph, tds, ec, turbidity, temperature, water_level, wqi):
    data = {'do': do, 
        'hard.': hardness, 
        'sal.': salinity, 
        'ph': ph, 
        'tds': tds, 
        'ec': ec,
        'turb.': turbidity, 
        'temp.': temperature, 
        'waterL': water_level, 
        'wqi': wqi}

    try:
        with open('./datastore.json', 'w') as file:
            json.dump(data, file, indent=4)  # The 'indent' argument makes it pretty-printed
    except Exception:
        pass


def get_local_json():
    with open('./datastore.json', 'r') as file:
        output = json.load(file)
    
    return output
    
    