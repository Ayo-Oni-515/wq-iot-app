#!/usr/bin/env python3

"""
This python script presents the data on a dashboard whilst on the pi.
utilises the Streamlit package for data presentation.
(Might not be in the final implementation).
"""

import streamlit as st

st.title("WQM Dashboard")
st.write("Welcome to the Raspberry pi's dashboard")

wqi_col, water_level_col = st.columns(2)

with wqi_col:
    st.subheader("WQI")
with water_level_col:
    st.subheader("Water Level")


st.subheader("Parameters")