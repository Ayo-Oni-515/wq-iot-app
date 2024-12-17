# **Water Quality IoT App**
### *An IoT Application with config files for water quality monitoring and pump control automation.*
      
Project Integration was achieved using a Raspberry Pi 4 for hardware automation, Flutter for creating the android application and FireBase for backend integration.

Hardware Commmunication Protocols utilized
1. SPI (For Analog Sensors: pH, TDS and Turbidity)
2. 1-Wire (For Digital Sensor: Temperature sensor)


## mobile-app/wqm-app/ 
Flutter Application Directory

To install dependencies

    flutter pub get
---

## raspberry-config/

Python Script Directory for Raspberry Pi Configuration

To install dependencies

    pip install -r requirements.txt

### ./startup.py
>This script ensures that the GPIO pins are reset on startup to avoid issues if power is suddenly lost.

### ./wqm.py
>This script handles water quality monitoring.

### ./pump_control.py
>This script handles pump control.

### ./cron_commands.txt
>This text file contains all commands that should be inserted into the crontab for running script in the background.

### ./main.py
>This script aggregates all parts of the project's hardware implementation.
It merges the functionality of different aspects of the project such as 
sensor operation and control, solenoid valve control, ultrasonic sensor
operation and control.

### ./control

>This directory e6ncompasses scripts handling both tank and test kit ultrasonic sensor operation.

#### ./control/control_constants.py
>This script contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.

### ./errors
>This directory contains all exceptions that can be raised in the event of extending the project's error handling capabilities.

### ./sensors
>This directory encompasses scripts handling both Analog and Digital sensor operation ranging from the ph, tds, turbidity and temperature sensor respectively.

#### ./sensors/sensor_constants.py
>This script contains all project-dependent constants (global variables).
It ensures that changes can be made to one file only.
This would ensure easy duplication and scalability.