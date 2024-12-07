#!/usr/bin/env python3

"""
This is the python script for evaluating the project's selected wqi model (CCMEWQI).
It computes the water quality index based on the obtained parameter.
"""

from sensors import sensor_constants as snse_const
import sys

def validator(ph, turbidity, ec, tds, temperature):
    # pH limit
    standard_ph_low = snse_const.PH_LOW
    standard_ph_high = snse_const.PH_HIGH

    # turbidity limit
    standard_turbidity = snse_const.TURBIDITY_HIGH

    # EC limit
    standard_ec_low = snse_const.EC_LOW
    standard_ec_high = snse_const.EC_HIGH

    # TDS limit
    standard_tds = snse_const.TDS_HIGH

    # Temperature limit
    standard_temperature_low = snse_const.TEMPERATURE_LOW
    standard_temperature_high = snse_const.TEMPERATURE_HIGH

    number_of_failed_variables = 0
    number_of_failed_test = 0
    excursion = []

    # pH validation
    if ph < standard_ph_low:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        ph_excursion = (standard_ph_low / ph) - 1
        excursion.append(ph_excursion)
    elif ph > standard_ph_high:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        ph_excursion = (ph / standard_ph_low) - 1
        excursion.append(ph_excursion)

    # Turbidity validation
    if turbidity > standard_turbidity:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        turbididty_excursion = (turbidity / standard_turbidity) - 1
        excursion.append(turbididty_excursion)

    # ec validation
    if ec < standard_ec_low:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        ec_excursion = (standard_ec_low / ec) - 1
        excursion.append(ec_excursion)
    elif ec > standard_ec_high:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        ec_excursion = (ec / standard_ec_low) - 1
        excursion.append(ec_excursion)

    # tds validation
    if tds > standard_tds:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        tds_excursion = (tds / standard_tds) - 1
        excursion.append(tds_excursion)

    # temperature validation
    if temperature < standard_temperature_low:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        temperature_excursion = (standard_temperature_low / temperature) - 1
        excursion.append(temperature_excursion)
    elif temperature > standard_temperature_high:
        number_of_failed_variables += 1
        number_of_failed_test += 1
        temperature_excursion = (temperature / standard_temperature_low) - 1
        excursion.append(temperature_excursion)

    excursion_summation = sum(excursion)
    result = {"number of failed variables": number_of_failed_variables, 
              "number of failed test": number_of_failed_test, 
              "excursion summation": excursion_summation}
    return result



def wqi(ph, turbidity, ec, tds, temperature):
    validate = validator(ph, turbidity, ec, tds, temperature)   
    number_of_failed_variables = validate["number of failed variables"]
    number_of_failed_test = validate["number of failed test"] 
    excursion_summation = validate["excursion summation"]
    total_number_of_variables = 5
    total_number_of_tests = 5

    nse = excursion_summation / total_number_of_tests

    scope_factor = (number_of_failed_variables / total_number_of_variables) * 100

    frequency_factor = (number_of_failed_test / total_number_of_tests) * 100

    amplitude_factor = (nse / (nse + 1)) * 100
    
    wqi = 100 - ((((scope_factor ** 2) + (frequency_factor ** 2) + (amplitude_factor ** 2)) ** 0.5) / 1.732)
    
    return round(wqi, 2)

# print(wqi(5, 2, 10000, 3000, 30)) #Test

if __name__ == "__main__":
    sys.exit(0)