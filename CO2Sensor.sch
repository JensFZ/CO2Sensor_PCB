EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "CO2Sensor"
Date "2021-03-05"
Rev "1.0"
Comp "JensFZ"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L sensors:DHT22_Temperature_Humidity TH1
U 1 1 603D91F5
P 6600 2100
F 0 "TH1" H 6878 2623 60  0000 L CNN
F 1 "DHT22_Temperature_Humidity" H 6878 2517 60  0000 L CNN
F 2 "DHT22:DHT22_Temperature_Humidity" H 6878 2411 60  0000 L CNN
F 3 "" H 6600 2100 60  0000 C CNN
	1    6600 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 603DCE9D
P 6150 4700
F 0 "R1" V 5943 4700 50  0000 C CNN
F 1 "R" V 6034 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6080 4700 50  0001 C CNN
F 3 "~" H 6150 4700 50  0001 C CNN
	1    6150 4700
	0    1    1    0   
$EndComp
NoConn ~ 2850 1900
NoConn ~ 3750 1550
NoConn ~ 3750 1650
NoConn ~ 3750 1800
NoConn ~ 3750 1900
NoConn ~ 6650 2100
$Comp
L Mechanical:MountingHole H1
U 1 1 6043BBF3
P 750 6550
F 0 "H1" H 850 6596 50  0000 L CNN
F 1 "MountingHole" H 850 6505 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 750 6550 50  0001 C CNN
F 3 "~" H 750 6550 50  0001 C CNN
	1    750  6550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6043C2CB
P 750 6750
F 0 "H2" H 850 6796 50  0000 L CNN
F 1 "MountingHole" H 850 6705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 750 6750 50  0001 C CNN
F 3 "~" H 750 6750 50  0001 C CNN
	1    750  6750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6043C41A
P 750 6950
F 0 "H3" H 850 6996 50  0000 L CNN
F 1 "MountingHole" H 850 6905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 750 6950 50  0001 C CNN
F 3 "~" H 750 6950 50  0001 C CNN
	1    750  6950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6043C5F3
P 750 7150
F 0 "H4" H 850 7196 50  0000 L CNN
F 1 "MountingHole" H 850 7105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_DIN965" H 750 7150 50  0001 C CNN
F 3 "~" H 750 7150 50  0001 C CNN
	1    750  7150
	1    0    0    -1  
$EndComp
$Comp
L luanode:ESP32_DevKit_V1_DOIT U1
U 1 1 6046B887
P 4650 3600
F 0 "U1" H 4650 4867 50  0000 C CNN
F 1 "ESP32_DevKit_V1_DOIT" H 4650 4776 50  0000 C CNN
F 2 "luanode:esp32_devkit_v1_doit" H 4200 4750 50  0001 C CNN
F 3 "https://aliexpress.com/item/32864722159.html" H 4200 4750 50  0001 C CNN
	1    4650 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3600 6450 3600
Wire Wire Line
	6450 3600 6450 2100
Wire Wire Line
	5250 4700 5850 4700
Wire Wire Line
	5250 4550 5750 4550
Wire Wire Line
	5750 4550 5750 2350
Wire Wire Line
	6750 2350 6750 2100
Wire Wire Line
	5750 2350 6750 2350
Wire Wire Line
	5850 3600 5850 4700
Wire Wire Line
	5850 4700 6000 4700
Connection ~ 5850 4700
Wire Wire Line
	6300 4700 6550 4700
Wire Wire Line
	6550 4700 6550 4100
Wire Wire Line
	5250 4100 6550 4100
Connection ~ 6550 4100
Wire Wire Line
	6550 4100 6550 2100
Wire Wire Line
	4050 4700 2650 4700
Wire Wire Line
	2650 4700 2650 1400
Wire Wire Line
	2650 1400 3250 1400
Wire Wire Line
	4050 4550 3250 4550
Wire Wire Line
	3250 4550 3250 2100
$Comp
L mh_z19b:MH-Z19B U2
U 1 1 603DAC4D
P 3250 1750
F 0 "U2" H 3300 2281 50  0000 C CNN
F 1 "MH-Z19B" H 3300 2190 50  0000 C CNN
F 2 "MH-Z19:Winsen_MH-Z19B" H 3250 1100 50  0001 C CNN
F 3 "https://www.winsen-sensor.com/d/files/MH-Z19B.pdf" H 3200 1500 50  0001 C CNN
	1    3250 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1650 2800 1650
Wire Wire Line
	2800 1650 2800 3350
Wire Wire Line
	2800 3350 4050 3350
Wire Wire Line
	4050 3500 2750 3500
Wire Wire Line
	2750 3500 2750 1550
Wire Wire Line
	2750 1550 2850 1550
NoConn ~ 5250 2750
NoConn ~ 5250 2900
NoConn ~ 5250 3050
NoConn ~ 5250 3200
NoConn ~ 5250 3350
NoConn ~ 5250 3500
NoConn ~ 5250 3650
NoConn ~ 5250 3800
NoConn ~ 5250 3950
NoConn ~ 5250 4250
NoConn ~ 5250 4400
NoConn ~ 4050 3950
NoConn ~ 4050 3800
NoConn ~ 4050 3650
NoConn ~ 4050 3200
NoConn ~ 4050 3050
NoConn ~ 4050 2900
NoConn ~ 4050 2750
NoConn ~ 4050 2600
$Comp
L Device:LED D1
U 1 1 6042A2C9
P 3250 6000
F 0 "D1" V 3289 5882 50  0000 R CNN
F 1 "LED" V 3198 5882 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3250 6000 50  0001 C CNN
F 3 "~" H 3250 6000 50  0001 C CNN
	1    3250 6000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 6150 3250 6400
$Comp
L Device:R R2
U 1 1 6042F5AD
P 3250 5600
F 0 "R2" H 3320 5646 50  0000 L CNN
F 1 "R" H 3320 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3180 5600 50  0001 C CNN
F 3 "~" H 3250 5600 50  0001 C CNN
	1    3250 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60430948
P 3600 5600
F 0 "R3" H 3670 5646 50  0000 L CNN
F 1 "R" H 3670 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3530 5600 50  0001 C CNN
F 3 "~" H 3600 5600 50  0001 C CNN
	1    3600 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 60430C9B
P 3600 6000
F 0 "D2" V 3639 5882 50  0000 R CNN
F 1 "LED" V 3548 5882 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3600 6000 50  0001 C CNN
F 3 "~" H 3600 6000 50  0001 C CNN
	1    3600 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 60431255
P 3950 6000
F 0 "D3" V 3989 5882 50  0000 R CNN
F 1 "LED" V 3898 5882 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3950 6000 50  0001 C CNN
F 3 "~" H 3950 6000 50  0001 C CNN
	1    3950 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 60431AB7
P 3950 5600
F 0 "R4" H 4020 5646 50  0000 L CNN
F 1 "R" H 4020 5555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3880 5600 50  0001 C CNN
F 3 "~" H 3950 5600 50  0001 C CNN
	1    3950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6150 3600 6400
Wire Wire Line
	3600 6400 3250 6400
Wire Wire Line
	3950 6400 3600 6400
Connection ~ 3600 6400
Wire Wire Line
	3250 5750 3250 5850
Wire Wire Line
	3600 5750 3600 5850
Wire Wire Line
	3950 5750 3950 5850
Wire Wire Line
	4050 4400 3950 4400
Wire Wire Line
	3950 4400 3950 5450
Wire Wire Line
	4050 4250 3600 4250
Wire Wire Line
	3600 4250 3600 5450
Wire Wire Line
	4050 4100 3350 4100
Wire Wire Line
	3350 4100 3350 4850
Wire Wire Line
	3350 4850 3250 4850
Wire Wire Line
	3250 4850 3250 5450
Wire Wire Line
	3950 6150 3950 6400
Wire Wire Line
	3250 4550 2950 4550
Wire Wire Line
	2950 4550 2950 6400
Wire Wire Line
	2950 6400 3250 6400
Connection ~ 3250 4550
Connection ~ 3250 6400
Connection ~ 2650 4700
Wire Wire Line
	1300 4550 2950 4550
Connection ~ 2950 4550
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 60475D51
P 1400 5750
F 0 "J1" V 1272 5830 50  0000 L CNN
F 1 "Screw_Terminal_01x02" V 1363 5830 50  0000 L CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type059_RT06302HBWC_1x02_P3.50mm_Horizontal" H 1400 5750 50  0001 C CNN
F 3 "~" H 1400 5750 50  0001 C CNN
	1    1400 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 4550 1300 5550
Wire Wire Line
	1400 4700 1400 5550
Wire Wire Line
	1400 4700 2650 4700
$Comp
L Device:Buzzer BZ1
U 1 1 60498B49
P 5400 1450
F 0 "BZ1" V 5451 1263 50  0000 R CNN
F 1 "Buzzer" V 5360 1263 50  0000 R CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 5375 1550 50  0001 C CNN
F 3 "~" V 5375 1550 50  0001 C CNN
	1    5400 1450
	0    -1   -1   0   
$EndComp
Connection ~ 5750 2350
Wire Wire Line
	5750 1550 5500 1550
Wire Wire Line
	5750 1550 5750 2350
$Comp
L Device:R R5
U 1 1 604A16BE
P 5300 1950
F 0 "R5" H 5370 1996 50  0000 L CNN
F 1 "R" H 5370 1905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5230 1950 50  0001 C CNN
F 3 "~" H 5300 1950 50  0001 C CNN
	1    5300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1800 5300 1550
Wire Wire Line
	5300 2100 5300 2600
Wire Wire Line
	5300 2600 5250 2600
$EndSCHEMATC
