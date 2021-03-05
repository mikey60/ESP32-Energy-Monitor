# ESP32-Energy-Monitor
Hardware and code are designed to use the Aeon labs Home Energy Meter, model DSB09104-zwus, current clamps and housing.  I was frustrated with the occasional intermittent connection of the Aeon Labs Home Energy meter because the Z-Wave hub and energy meter were two floors apart.  Also the energy meter would occasionally give very high erroneous readings.  The unit did not work at all after I upgraded the firmware. That is what led to the ESP32 energy monitor project.

**Features:**
* Uses Aeon labs DSB09104-zwus current clamps and housing
* Wifi has increased signal strength over Z-Wave
* Uses a minimum amount of components
* Calculates real power like residential energy meters
* The capability of calculating power factor could be added
* Can easily adjust the scale factors to get agreement with energy company's meter
* Can debug using WiFi and telnet
* Can download new code Over The Air (OTA)


**Disadvantages:**
* The power supply is old school with a 60Hz transformer with a diode bridge and 1000uF capacitor to provide the DC power and the 60 Hz AC signal to the energy meter.  I picked up the 6 volt DC, 800mA class 2 power supply at the local surplus store.  I opened the power supply to add the two wires for the sine wave input to the energy monitor.  I also added two 1 amp rectifier diodes in series with the filtered DC output to the reduce the power of the AMS1117-3.3 LDO regulator on the energy monitor board.
* There is some distortion of the sine wave voltage due to the load on the power supply.
* The output of the current clamps is also distorted especially at low currents. The linearity of the output versus power is not too bad even with the distortion.
* The WiFi activity adds some noise to  the A/D coversions.
* The energy totals get reset if there is a wifi problem or power interruption. Additonal code could be written to keep a running sum in Flash every so often.


**PCB**

The KiCad PCB files can be found in the PCB folder including a PDF file of the schematic and layout.
There are two modifications that I made to the hardware design that are not shown in the documentation of the PCB folder.

Modifications
* I added a 22uF capacitor directly across the output and ground pins of the AMS1117-3.3 LDO regulator to stop the output oscillation.  The other 22uF capacitor on the 3.3 volt output of the LDO regulator is close to the ESP32. 
* I addded a 200pF capacitor and a 100 ohm resistor to the op amp circuit that provides the 3.3/2 volt virtual ground to provide stability when driving a capacitive load.  The output would oscillate when a 1x probe (120pF capacitance) was touched to the output.  The Micro-Cap 12 stability analysis showed that the circuit should be stable with a 120pF capacitor.  See 'Stability Analysis' in the data folder. Maybe there is other capacitances I am not accounting for or maybe the LMC6484 op amp I purchased on ebay is deficient in the stability performance area.  The Micro-Cap file is also in the data folder.  By the way, the Micro-cap 12 simulator is now free. 

**Other Information**

* Pictures of the finished device can be found in the images folder.
* A plot of the current consumption of the device can be found in the data folder.
* I attached a logic analyzer  to pin IO4 and let it run for an hour and did not see any missed 1 KHz samples
