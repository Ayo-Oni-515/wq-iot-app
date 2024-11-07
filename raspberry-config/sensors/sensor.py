#!/usr/bin/env python3
# import spidev


class Analog_Sensor:
    def __init__(self, bus=0, device=0, max_speed=1350000, channel=0):
        self.channel = channel
        # self.spi = spidev.SpiDev()
        # self.spi.open(bus, device)  # Open on bus 0, device 0
        # self.spi.max_speed_hz = max_speed
        

    def read_adc(self): #SPI Communication
        self.adc = self.spi.xfer2([1, (8 + self.channel) << 4, 0])
        self.data = ((self.adc[1] & 3) << 8) + self.adc[2]
        return self.data
    

    def read_voltage(self): 
        return self.data * (3.3 / 1023)
    

    def test(self):
        return self.channel


class Digital_Sensor:
    def __init__(self) -> None:
        pass


# class TurbiditySensor:
#     def __init__(self, bus=0, device=0, max_speed_hz=1350000):
#         """Initialize the turbidity sensor with SPI configuration"""
#         try:
#             self.spi = spidev.SpiDev()
#             self.spi.open(bus, device)
#             self.spi.max_speed_hz = max_speed_hz
#             # Additional SPI settings that might be needed
#             self.spi.mode = 0  # Set SPI mode (mode 0)
#             self.spi.bits_per_word = 8
#         except Exception as e:
#             print(f"Error initializing SPI: {e}")
#             raise

#     def read_adc(self, channel):
#         """Read ADC value from specified channel"""
#         if not 0 <= channel <= 7:  # Most ADCs have 8 channels (0-7)
#             raise ValueError("Channel must be 0-7")
            
#         try:
#             # MCP3008 protocol: Start bit (1) + Single/Diff bit (1) + Channel bits (3) + Null bit
#             # First byte: Start bit + Single/Diff + D2
#             # Second byte: D1 + D0 + Null + Null + Null + Null
#             adc = self.spi.xfer2([1, (8 + channel) << 4, 0])
#             data = ((adc[1] & 3) << 8) + adc[2]
#             return data
#         except Exception as e:
#             print(f"Error reading ADC: {e}")
#             return None

#     def calculate_voltage(self, adc_value, v_ref=3.3):
#         """Convert ADC value to voltage"""
#         if adc_value is None:
#             return None
#         return adc_value * (v_ref / 1023.0)  # 10-bit ADC (2^10 - 1 = 1023)

#     def calculate_turbidity(self, voltage):
#         """Convert voltage to turbidity value (NTU)"""
#         if voltage is None:
#             return None
            
#         # Calibration coefficients (should be adjusted based on sensor calibration)
#         TURBIDITY_SLOPE = -1000  # Example slope
#         TURBIDITY_OFFSET = 3000  # Example offset
        
#         return TURBIDITY_OFFSET + (voltage * TURBIDITY_SLOPE)

#     def read_turbidity(self):
#         """Read and calculate turbidity value"""
#         adc_value = self.read_adc(0)  # Using channel 0
#         voltage = self.calculate_voltage(adc_value)
#         turbidity = self.calculate_turbidity(voltage)
#         return {
#             'adc': adc_value,
#             'voltage': voltage,
#             'turbidity': turbidity
#         }

#     def close(self):
#         """Clean up SPI connection"""
#         self.spi.close()

# def main():
#     # Example usage
#     try:
#         # Initialize sensor
#         sensor = TurbiditySensor()
        
#         print("Starting turbidity measurements...")
#         print("Press CTRL+C to stop")
        
#         while True:
#             readings = sensor.read_turbidity()
#             print(f"ADC: {readings['adc']}, "
#                   f"Voltage: {readings['voltage']:.2f}V, "
#                   f"Turbidity: {readings['turbidity']:.1f} NTU")
#             time.sleep(1)
            
#     except KeyboardInterrupt:
#         print("\nStopping measurements...")
#     except Exception as e:
#         print(f"Error: {e}")
#     finally:
#         if 'sensor' in locals():
#             sensor.close()
#             print("Sensor connection closed")

# if __name__ == "__main__":
#     main()