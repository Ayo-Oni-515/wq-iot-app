#!/usr/bin/env python3

"""
This is the python script for the project's selected wqi model (CCMEWQI).
It computes the water quality index based on the obtained parameter.
"""

def ccmewqi(ph, turbidiy, ec, tds, temperature):
    scope_factor = 0
    frequency_factor = 0
    amplitude_factor = 0
    excursion = 0
    total_number_of_tests = 0
    nse = excursion / total_number_of_tests
    wqi = 100 - ((((scope_factor ** 2) + (frequency_factor ** 2) + (amplitude_factor ** 2)) ** 0.5) / 1.732)
    return wqi