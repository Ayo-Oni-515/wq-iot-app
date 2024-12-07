#!/usr/bin/env python3

"""
This script handles the LCD screen meant to display parameter values. 
"""

import time
from RPLCD.i2c import CharLCD

# Initialize the LCD (replace '0x27' with your I2C address)
lcd = CharLCD('PCF8574', 0x27)

# Write text to the LCD
lcd.write_string("Hello, World!")
time.sleep(2)

# Clear the screen
lcd.clear()

# Display dynamic messages
lcd.cursor_pos = (0, 0)  # Set cursor to row 0, column 0
lcd.write_string("Dynamic Text:")
time.sleep(2)

for i in range(10):
    lcd.clear()
    lcd.write_string(f"Count: {i}")
    time.sleep(1)

# Clear the screen when done
lcd.clear()


# ### **Interfacing an LCD Screen with I2C on Raspberry Pi**

# Using I2C simplifies the process of connecting an LCD screen to the Raspberry Pi. Here's a step-by-step guide to set it up:

# ---

# ### **Hardware Requirements**
# 1. **Raspberry Pi** (any model with GPIO pins).
# 2. **I2C-compatible LCD module** (e.g., 16x2 or 20x4 with a PCF8574 I2C backpack).
# 3. Jumper wires.

# ---

# ### **Wiring Diagram**
# Connect the LCD module's I2C pins to the Raspberry Pi GPIO pins:

# | **LCD Pin** | **Raspberry Pi Pin** | **Function**      |
# |-------------|----------------------|-------------------|
# | GND         | Pin 6 (GND)          | Ground            |
# | VCC         | Pin 2 (5V)           | Power supply      |
# | SDA         | Pin 3 (GPIO2/SDA)    | I2C Data          |
# | SCL         | Pin 5 (GPIO3/SCL)    | I2C Clock         |

# ---

# ### **Enable I2C on Raspberry Pi**
# 1. Open Raspberry Pi configuration:
#    ```bash
#    sudo raspi-config
#    ```
# 2. Go to **Interface Options > I2C** and enable it.
# 3. Reboot your Raspberry Pi:
#    ```bash
#    sudo reboot
#    ```

# ---

# ### **Install Necessary Software**
# 1. Update your system:
#    ```bash
#    sudo apt update
#    ```
# 2. Install I2C tools and Python libraries:
#    ```bash
#    sudo apt install -y python3-smbus i2c-tools
#    pip install RPLCD
#    ```

# ---

# ### **Find the I2C Address**
# Detect the I2C address of the LCD:
# ```bash
# sudo i2cdetect -y 1
# ```
# The detected address will look like `0x27` or `0x3F`. Note this for the script.

# ---

# ### **Python Script for I2C LCD**
# Here’s a simple Python script to display messages on the LCD:

# ```python
# import time
# from RPLCD.i2c import CharLCD

# # Initialize the LCD (replace '0x27' with your I2C address)
# lcd = CharLCD('PCF8574', 0x27)

# # Write text to the LCD
# lcd.write_string("Hello, World!")
# time.sleep(2)

# # Clear the screen
# lcd.clear()

# # Display dynamic messages
# lcd.cursor_pos = (0, 0)  # Set cursor to row 0, column 0
# lcd.write_string("Dynamic Text:")
# time.sleep(2)

# for i in range(10):
#     lcd.clear()
#     lcd.write_string(f"Count: {i}")
#     time.sleep(1)

# # Clear the screen when done
# lcd.clear()
# ```

# ---

# ### **Key Functions in the Script**
# 1. `CharLCD('PCF8574', 0x27)`: Initializes the LCD with the detected I2C address.
# 2. `lcd.write_string("Text")`: Displays a string on the screen.
# 3. `lcd.clear()`: Clears the screen.
# 4. `lcd.cursor_pos = (row, col)`: Sets the cursor position.

# ---

# ### **Customizing the Display**
# You can create custom characters, scroll text, or control the backlight:
# - **Custom Characters**:
#    Define custom characters using a list of binary values.
# - **Backlight Control**:
#    Use the `backlight_enabled` property:
#    ```python
#    lcd.backlight_enabled = True
#    ```

# ---

# ### **Troubleshooting**
# 1. **I2C Address Not Detected**:
#    - Double-check wiring.
#    - Ensure I2C is enabled (`sudo raspi-config`).
# 2. **Incorrect Address**:
#    - Verify the I2C address using `sudo i2cdetect -y 1`.
# 3. **No Display or Garbled Text**:
#    - Adjust the contrast knob on the I2C backpack.

# ---

# Let me know if you need help adding advanced features, like combining this with your temperature sensor data!