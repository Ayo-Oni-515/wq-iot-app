#!/usr/bin/env python3

"""
This python script continually monitors the raspberry pi's operating temperature.
"""

import os

def raspi_cpu_temp():
    try:
        temp_output = os.popen("vcgencmd measure_temp").readline()
        temp = temp_output.replace("temp=", "").replace("'C\n", "")
        return float(temp)
    except:
        return None


