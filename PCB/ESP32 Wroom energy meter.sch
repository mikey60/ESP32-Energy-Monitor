EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R7
U 1 1 5C479A80
P 2500 7000
F 0 "R7" V 2600 7000 50  0000 C CNN
F 1 "75k" V 2384 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 7000 50  0001 C CNN
F 3 "~" H 2500 7000 50  0001 C CNN
	1    2500 7000
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5C47DC7B
P 5250 1600
F 0 "C2" H 5050 1700 50  0000 L CNN
F 1 "22uF" H 4950 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5288 1450 50  0001 C CNN
F 3 "~" H 5250 1600 50  0001 C CNN
	1    5250 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C47FBA1
P 7850 5000
F 0 "#PWR0101" H 7850 4750 50  0001 C CNN
F 1 "GND" H 7855 4827 50  0000 C CNN
F 2 "" H 7850 5000 50  0001 C CNN
F 3 "" H 7850 5000 50  0001 C CNN
	1    7850 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5C4B2900
P 5250 1900
F 0 "#PWR0102" H 5250 1650 50  0001 C CNN
F 1 "GND" H 5255 1727 50  0000 C CNN
F 2 "" H 5250 1900 50  0001 C CNN
F 3 "" H 5250 1900 50  0001 C CNN
	1    5250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C4B61C8
P 3550 4600
F 0 "R3" V 3650 4600 50  0000 C CNN
F 1 "10k" V 3434 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3480 4600 50  0001 C CNN
F 3 "~" H 3550 4600 50  0001 C CNN
	1    3550 4600
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 5C4B718F
P 5250 1250
F 0 "#PWR0103" H 5250 1100 50  0001 C CNN
F 1 "+3.3V" H 5265 1423 50  0000 C CNN
F 2 "" H 5250 1250 50  0001 C CNN
F 3 "" H 5250 1250 50  0001 C CNN
	1    5250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1250 5250 1400
$Comp
L power:+3.3V #PWR0104
U 1 1 5C4BCB07
P 1750 3700
F 0 "#PWR0104" H 1750 3550 50  0001 C CNN
F 1 "+3.3V" H 1765 3873 50  0000 C CNN
F 2 "" H 1750 3700 50  0001 C CNN
F 3 "" H 1750 3700 50  0001 C CNN
	1    1750 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5C4C6A47
P 10400 3400
F 0 "J1" H 10625 3650 50  0000 R CNN
F 1 "UART" H 10400 3650 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10400 3400 50  0001 C CNN
F 3 "~" H 10400 3400 50  0001 C CNN
	1    10400 3400
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW2
U 1 1 5C4C850B
P 9150 2250
F 0 "SW2" H 9150 2485 50  0000 C CNN
F 1 "BOOT" H 9150 2394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_EVQPE1" H 9150 2250 50  0001 C CNN
F 3 "" H 9150 2250 50  0001 C CNN
	1    9150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2250 9450 2250
$Comp
L power:GND #PWR0105
U 1 1 5C4CCCA0
P 9450 2850
F 0 "#PWR0105" H 9450 2600 50  0001 C CNN
F 1 "GND" H 9455 2677 50  0000 C CNN
F 2 "" H 9450 2850 50  0001 C CNN
F 3 "" H 9450 2850 50  0001 C CNN
	1    9450 2850
	1    0    0    -1  
$EndComp
Text Label 1150 1350 0    50   ~ 0
Vin
Text Label 1150 1650 0    50   ~ 0
GND
$Comp
L Device:C_Small C5
U 1 1 5C4F4742
P 10350 2500
F 0 "C5" H 10150 2500 50  0000 L CNN
F 1 "0.047uF" H 10050 2400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 2500 50  0001 C CNN
F 3 "~" H 10350 2500 50  0001 C CNN
	1    10350 2500
	1    0    0    -1  
$EndComp
Text Label 10425 3325 0    50   ~ 0
TX
Text Label 10425 3450 0    50   ~ 0
RX
Text Label 10425 3550 0    50   ~ 0
GND
$Comp
L Amplifier_Operational:LMC6484 U3
U 1 1 5E98E376
P 3600 6650
F 0 "U3" H 3600 7017 50  0000 C CNN
F 1 "LMC6484" H 3600 6926 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 3550 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc6484.pdf" H 3650 6850 50  0001 C CNN
	1    3600 6650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LMC6484 U3
U 2 1 5E991BBF
P 5050 4100
F 0 "U3" H 5050 4467 50  0000 C CNN
F 1 "LMC6484" H 5050 4376 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc6484.pdf" H 5100 4300 50  0001 C CNN
	2    5050 4100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5C4C8469
P 10050 2250
F 0 "SW1" H 10050 2485 50  0000 C CNN
F 1 "Reset" H 10050 2394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_EVQPE1" H 10050 2250 50  0001 C CNN
F 3 "" H 10050 2250 50  0001 C CNN
	1    10050 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5C47E836
P 10350 1600
F 0 "R10" V 10450 1600 50  0000 C CNN
F 1 "22K" V 10250 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10280 1600 50  0001 C CNN
F 3 "~" H 10350 1600 50  0001 C CNN
	1    10350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C479AEC
P 2500 6550
F 0 "R6" V 2600 6550 50  0000 C CNN
F 1 "75k" V 2384 6550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 6550 50  0001 C CNN
F 3 "~" H 2500 6550 50  0001 C CNN
	1    2500 6550
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:LMC6484 U3
U 5 1 5E9AC178
P 1850 4100
F 0 "U3" H 1808 4146 50  0000 L CNN
F 1 "LMC6484" H 1808 4055 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 1800 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc6484.pdf" H 1900 4300 50  0001 C CNN
	5    1850 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C4FC0E5
P 1350 1400
F 0 "J2" H 1456 1578 50  0000 C CNN
F 1 "Power_Connect" H 1000 1350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1350 1400 50  0001 C CNN
F 3 "~" H 1350 1400 50  0001 C CNN
	1    1350 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5E9B34C8
P 3100 1600
F 0 "C1" H 2900 1700 50  0000 L CNN
F 1 "22uF" H 2800 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3138 1450 50  0001 C CNN
F 3 "~" H 3100 1600 50  0001 C CNN
	1    3100 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1400 3100 1400
Wire Wire Line
	3100 1400 3100 1450
Wire Wire Line
	5250 1750 5250 1800
$Comp
L Regulator_Linear:AMS1117-3.3 U2
U 1 1 5CF441F5
P 3650 1400
F 0 "U2" H 3650 1642 50  0000 C CNN
F 1 "AMS1117-3.3" H 3650 1551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3650 1600 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3750 1150 50  0001 C CNN
	1    3650 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1700 3650 1800
Wire Wire Line
	3100 1750 3100 1800
Wire Wire Line
	3100 1800 3650 1800
Wire Wire Line
	3300 6750 3200 6750
$Comp
L Device:R R2
U 1 1 5E9D59E4
P 2700 4400
F 0 "R2" V 2800 4400 50  0000 C CNN
F 1 "22K" V 2584 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 4400 50  0001 C CNN
F 3 "~" H 2700 4400 50  0001 C CNN
	1    2700 4400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5E9D76DA
P 2700 3900
F 0 "R1" V 2800 3900 50  0000 C CNN
F 1 "22K" V 2584 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 3900 50  0001 C CNN
F 3 "~" H 2700 3900 50  0001 C CNN
	1    2700 3900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 5E9DD16D
P 3650 7000
F 0 "R9" V 3750 7000 50  0000 C CNN
F 1 "5.6k" V 3534 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3580 7000 50  0001 C CNN
F 3 "~" H 3650 7000 50  0001 C CNN
	1    3650 7000
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5E9DD661
P 2950 6350
F 0 "R8" V 3050 6350 50  0000 C CNN
F 1 "5.6k" V 2834 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2880 6350 50  0001 C CNN
F 3 "~" H 2950 6350 50  0001 C CNN
	1    2950 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 7000 4000 7000
Wire Wire Line
	4000 7000 4000 6650
Wire Wire Line
	4000 6650 3900 6650
Wire Wire Line
	3500 7000 3200 7000
Wire Wire Line
	3300 4300 3200 4300
Wire Wire Line
	3200 4300 3200 4600
Wire Wire Line
	3200 4600 3400 4600
Wire Wire Line
	3700 4600 4000 4600
Wire Wire Line
	4000 4600 4000 4200
Wire Wire Line
	4000 4200 3900 4200
Wire Wire Line
	2700 4050 2700 4100
$Comp
L power:+3.3V #PWR0106
U 1 1 5E9E7AF4
P 2700 3750
F 0 "#PWR0106" H 2700 3600 50  0001 C CNN
F 1 "+3.3V" H 2715 3923 50  0000 C CNN
F 2 "" H 2700 3750 50  0001 C CNN
F 3 "" H 2700 3750 50  0001 C CNN
	1    2700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4550 2700 4700
Connection ~ 2700 4100
Wire Wire Line
	2700 4100 2700 4250
Wire Wire Line
	2700 4100 3300 4100
Wire Wire Line
	3200 6750 3200 7000
Connection ~ 3200 7000
Wire Wire Line
	3200 7000 2650 7000
$Comp
L Device:C_Small C4
U 1 1 5EA22FAB
P 2350 4400
F 0 "C4" H 2150 4400 50  0000 L CNN
F 1 "1uF" H 2050 4300 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2350 4400 50  0001 C CNN
F 3 "~" H 2350 4400 50  0001 C CNN
	1    2350 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4300 2350 4100
Wire Wire Line
	2350 4100 2700 4100
Wire Wire Line
	2350 4500 2350 4700
Wire Wire Line
	2350 4700 2700 4700
$Comp
L Device:R R4
U 1 1 5EA28822
P 2100 5350
F 0 "R4" V 2200 5350 50  0000 C CNN
F 1 "56" V 1984 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2030 5350 50  0001 C CNN
F 3 "~" H 2100 5350 50  0001 C CNN
	1    2100 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 5EA291F7
P 2100 5900
F 0 "R5" V 2200 5900 50  0000 C CNN
F 1 "56" V 1984 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2030 5900 50  0001 C CNN
F 3 "~" H 2100 5900 50  0001 C CNN
	1    2100 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 4600 4000 5550
Wire Wire Line
	4000 6100 2950 6100
Wire Wire Line
	2100 6100 2100 6050
Connection ~ 4000 4600
Wire Wire Line
	2100 5500 2100 5550
Wire Wire Line
	2100 5550 4000 5550
Connection ~ 4000 5550
Wire Wire Line
	4000 5550 4000 6100
Wire Wire Line
	2100 5200 2100 5150
Wire Wire Line
	2100 5750 2100 5700
Wire Wire Line
	9450 2250 9450 2800
Wire Wire Line
	1750 3800 1750 3750
Connection ~ 9450 2800
Wire Wire Line
	9450 2800 9450 2850
Connection ~ 9450 2250
Wire Wire Line
	10250 2250 10350 2250
$Comp
L power:+3.3V #PWR0108
U 1 1 5EA786FF
P 10350 1250
F 0 "#PWR0108" H 10350 1100 50  0001 C CNN
F 1 "+3.3V" H 10365 1423 50  0000 C CNN
F 2 "" H 10350 1250 50  0001 C CNN
F 3 "" H 10350 1250 50  0001 C CNN
	1    10350 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1450 10350 1250
Wire Wire Line
	10350 1750 10350 2000
Wire Wire Line
	9450 2250 9850 2250
Wire Wire Line
	10350 2600 10350 2800
Wire Wire Line
	9450 2800 10350 2800
Connection ~ 10350 2250
Wire Wire Line
	10350 2250 10350 2400
Wire Wire Line
	10800 2000 10350 2000
Connection ~ 10350 2000
Wire Wire Line
	10350 2000 10350 2250
Wire Wire Line
	10150 3500 10200 3500
Wire Wire Line
	1550 1400 3100 1400
Connection ~ 3100 1400
Wire Wire Line
	1550 1500 2150 1500
Wire Wire Line
	2150 1500 2150 1800
Wire Wire Line
	2150 1800 3100 1800
Connection ~ 3100 1800
$Comp
L power:GNDA #PWR0109
U 1 1 5EAA6F82
P 2700 4900
F 0 "#PWR0109" H 2700 4650 50  0001 C CNN
F 1 "GNDA" H 2705 4727 50  0000 C CNN
F 2 "" H 2700 4900 50  0001 C CNN
F 3 "" H 2700 4900 50  0001 C CNN
	1    2700 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0110
U 1 1 5EAA7F70
P 1750 4650
F 0 "#PWR0110" H 1750 4400 50  0001 C CNN
F 1 "GNDA" H 1755 4477 50  0000 C CNN
F 2 "" H 1750 4650 50  0001 C CNN
F 3 "" H 1750 4650 50  0001 C CNN
	1    1750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4400 1750 4550
$Comp
L Device:C_Small C3
U 1 1 5EAB43B7
P 1550 4100
F 0 "C3" H 1350 4100 50  0000 L CNN
F 1 "0.01uF" H 1250 4000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1550 4100 50  0001 C CNN
F 3 "~" H 1550 4100 50  0001 C CNN
	1    1550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4000 1550 3750
Wire Wire Line
	1550 3750 1750 3750
Connection ~ 1750 3750
Wire Wire Line
	1750 3750 1750 3700
Wire Wire Line
	1550 4200 1550 4550
Wire Wire Line
	1550 4550 1750 4550
Connection ~ 1750 4550
Wire Wire Line
	1750 4550 1750 4650
Connection ~ 2100 5150
Connection ~ 2100 5700
Wire Wire Line
	2650 6550 2950 6550
Wire Wire Line
	2950 6500 2950 6550
Connection ~ 2950 6550
Wire Wire Line
	2950 6550 3300 6550
Wire Wire Line
	2950 6200 2950 6100
Connection ~ 2950 6100
Wire Wire Line
	2950 6100 2100 6100
Wire Wire Line
	3650 1800 4450 1800
Connection ~ 3650 1800
Connection ~ 5250 1800
Wire Wire Line
	5250 1800 5250 1900
Wire Wire Line
	3950 1400 5250 1400
Connection ~ 5250 1400
Wire Wire Line
	5250 1400 5250 1450
$Comp
L power:GNDA #PWR0111
U 1 1 5EB2C2FE
P 4450 1900
F 0 "#PWR0111" H 4450 1650 50  0001 C CNN
F 1 "GNDA" H 4455 1727 50  0000 C CNN
F 2 "" H 4450 1900 50  0001 C CNN
F 3 "" H 4450 1900 50  0001 C CNN
	1    4450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1900 4450 1800
Connection ~ 4450 1800
Wire Wire Line
	4450 1800 5250 1800
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5EB4374B
P 1400 5150
F 0 "J3" H 1506 5328 50  0000 C CNN
F 1 "Line 2 Current" H 1050 5100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 5150 50  0001 C CNN
F 3 "~" H 1400 5150 50  0001 C CNN
	1    1400 5150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5EB43DD3
P 1400 5700
F 0 "J4" H 1506 5878 50  0000 C CNN
F 1 "Line 1 Current" H 1050 5650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1400 5700 50  0001 C CNN
F 3 "~" H 1400 5700 50  0001 C CNN
	1    1400 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5EB443AD
P 1450 6550
F 0 "J5" H 1556 6728 50  0000 C CNN
F 1 "60 Hz Sine Wave" H 1100 6500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1450 6550 50  0001 C CNN
F 3 "~" H 1450 6550 50  0001 C CNN
	1    1450 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6550 2350 6550
Wire Wire Line
	1800 7000 1800 6650
Wire Wire Line
	1800 6650 1650 6650
Wire Wire Line
	1800 7000 2350 7000
Wire Wire Line
	1600 5700 2100 5700
Wire Wire Line
	2100 6100 1750 6100
Wire Wire Line
	1750 6100 1750 5800
Wire Wire Line
	1750 5800 1600 5800
Connection ~ 2100 6100
Wire Wire Line
	2100 5550 1750 5550
Wire Wire Line
	1750 5550 1750 5250
Wire Wire Line
	1750 5250 1600 5250
Connection ~ 2100 5550
Wire Wire Line
	1600 5150 2100 5150
Wire Wire Line
	10800 2000 10800 900 
Wire Wire Line
	10800 900  7000 900 
Wire Wire Line
	7000 900  7000 2250
Wire Wire Line
	7000 2250 7250 2250
$Comp
L RF_Module:ESP32-WROOM-32D U1
U 1 1 5EA94905
P 7850 3450
F 0 "U1" H 7850 5031 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 7850 4940 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 7850 1950 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 7550 3500 50  0001 C CNN
	1    7850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2250 8950 2250
Wire Wire Line
	5250 1400 7850 1400
Wire Wire Line
	7850 1400 7850 2050
Wire Wire Line
	8900 3300 8900 2350
Wire Wire Line
	8900 2350 8450 2350
Wire Wire Line
	8900 3300 10200 3300
Wire Wire Line
	8750 3400 8750 2550
Wire Wire Line
	8750 2550 8450 2550
Wire Wire Line
	8750 3400 10200 3400
$Comp
L power:GND #PWR0107
U 1 1 5EAE7217
P 10150 3800
F 0 "#PWR0107" H 10150 3550 50  0001 C CNN
F 1 "GND" H 10155 3627 50  0000 C CNN
F 2 "" H 10150 3800 50  0001 C CNN
F 3 "" H 10150 3800 50  0001 C CNN
	1    10150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 6650 6700 6650
Wire Wire Line
	6700 6650 6700 6000
Wire Wire Line
	6700 6000 9100 6000
Connection ~ 4000 6650
Wire Wire Line
	2100 5700 8850 5700
Wire Wire Line
	2100 5150 8650 5150
Wire Wire Line
	8650 5150 8650 4550
Wire Wire Line
	8650 4550 8450 4550
Wire Wire Line
	8850 5700 8850 4450
Wire Wire Line
	8850 4450 8450 4450
Wire Wire Line
	9100 6000 9100 4250
Wire Wire Line
	9100 4250 8450 4250
$Comp
L Amplifier_Operational:LMC6484 U3
U 3 1 5EB333C2
P 3600 4200
F 0 "U3" H 3600 4567 50  0000 C CNN
F 1 "LMC6484" H 3600 4476 50  0000 C CNN
F 2 "" H 3550 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc6484.pdf" H 3650 4400 50  0001 C CNN
	3    3600 4200
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LMC6484 U3
U 4 1 5EB34C30
P 5100 3100
F 0 "U3" H 5100 3467 50  0000 C CNN
F 1 "LMC6484" H 5100 3376 50  0000 C CNN
F 2 "" H 5050 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmc6484.pdf" H 5150 3300 50  0001 C CNN
	4    5100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4200 4650 4200
Wire Wire Line
	4650 4200 4650 4500
Wire Wire Line
	4650 4500 5450 4500
Wire Wire Line
	5450 4500 5450 4100
Wire Wire Line
	5450 4100 5350 4100
Wire Wire Line
	4800 3200 4650 3200
Wire Wire Line
	4650 3200 4650 3500
Wire Wire Line
	4650 3500 5500 3500
Wire Wire Line
	5500 3500 5500 3100
Wire Wire Line
	5500 3100 5400 3100
Wire Wire Line
	4000 4200 4350 4200
Wire Wire Line
	4350 4200 4350 4000
Wire Wire Line
	4350 3000 4800 3000
Connection ~ 4000 4200
Wire Wire Line
	4750 4000 4350 4000
Connection ~ 4350 4000
Wire Wire Line
	4350 4000 4350 3000
Wire Wire Line
	10150 3500 10150 3800
$Comp
L Mechanical:MountingHole H1
U 1 1 5EBB89FD
P 10200 4750
F 0 "H1" H 10300 4796 50  0000 L CNN
F 1 "MountingHole" H 10300 4705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 10200 4750 50  0001 C CNN
F 3 "~" H 10200 4750 50  0001 C CNN
	1    10200 4750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EBB9CC4
P 10200 5150
F 0 "H2" H 10300 5196 50  0000 L CNN
F 1 "MountingHole" H 10300 5105 50  0000 L CNN
F 2 "MountingHole:MountingHole_2mm" H 10200 5150 50  0001 C CNN
F 3 "~" H 10200 5150 50  0001 C CNN
	1    10200 5150
	1    0    0    -1  
$EndComp
NoConn ~ 8450 3650
NoConn ~ 8450 3750
NoConn ~ 8450 3850
NoConn ~ 8450 3950
NoConn ~ 8450 4050
NoConn ~ 8450 4150
NoConn ~ 8450 3450
NoConn ~ 8450 3350
NoConn ~ 8450 3250
NoConn ~ 8450 3150
NoConn ~ 8450 3050
NoConn ~ 7250 3450
NoConn ~ 7250 3550
NoConn ~ 7250 3650
NoConn ~ 7250 3750
NoConn ~ 7250 3850
NoConn ~ 7250 3950
NoConn ~ 8450 2950
NoConn ~ 8450 2850
NoConn ~ 8450 2750
NoConn ~ 8450 2650
NoConn ~ 8450 2450
NoConn ~ 7250 2450
NoConn ~ 7250 2550
NoConn ~ 8450 4350
Wire Wire Line
	7850 4850 7850 5000
NoConn ~ 8450 3550
Wire Wire Line
	2700 4900 2700 4700
Connection ~ 2700 4700
Text Notes 3400 1100 0    100  ~ 0
soldered a 22uf Ceramic capacitor \nright across the output and ground \npins for stability
$EndSCHEMATC
