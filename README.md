# **Water Quality IoT App**
## *An IoT Application with config files for water quality monitoring and pump control automation.*
      
Project Integration was achieved using a Raspberry Pi 4 for hardware automation, Flutter for creating the android application and FireBase for backend integration.

Hardware Commmunication Protocols utilized
1. SPI (For Analog Sensors: pH, TDS and Turbidity)
2. 1-Wire (For Digital Sensor: Temperature sensor)
3. I2C (For the LCD Screen)


### [x] mobile-app/wqm-app/ 
Flutter Application Directory

    //Run to install dependencies

    flutter pub get

---

### [x] raspberry-config/
Python Script Directory for Raspberry Pi Configuration

    # Run to install dependencies

    pip install -r requirements.txt
