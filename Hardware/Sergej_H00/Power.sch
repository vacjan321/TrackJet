EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
L Sergej_Library:TPS61088RHLR U5
U 1 1 600F7313
P 3800 1850
F 0 "U5" H 3800 3017 50  0000 C CNN
F 1 "TPS61088RHLR" H 3800 2926 50  0000 C CNN
F 2 "Sergej_Library:IC_TPS61088RHLR" H 3800 1850 50  0001 L BNN
F 3 "" H 3800 1850 50  0001 L BNN
F 4 "C87357" H 3800 1850 50  0001 C CNN "LCSC"
	1    3800 1850
	1    0    0    -1  
$EndComp
Text HLabel 3100 1950 0    50   Input ~ 0
12V_MODE
$Comp
L power:GND #PWR0175
U 1 1 600FCFD5
P 4500 3000
F 0 "#PWR0175" H 4500 2750 50  0001 C CNN
F 1 "GND" H 4505 2827 50  0000 C CNN
F 2 "" H 4500 3000 50  0001 C CNN
F 3 "" H 4500 3000 50  0001 C CNN
	1    4500 3000
	1    0    0    -1  
$EndComp
Connection ~ 3100 2250
Wire Wire Line
	3100 2250 3100 2150
$Comp
L Device:Battery_Cell BT1
U 1 1 600FEE7F
P 9900 5300
F 0 "BT1" H 10018 5396 50  0000 L CNN
F 1 "18650" H 10018 5305 50  0000 L CNN
F 2 "Sergej_Library:BatteryHolder_MPD_BH-18650-PC2_NoHoles" V 9900 5360 50  0001 C CNN
F 3 "~" V 9900 5360 50  0001 C CNN
	1    9900 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 600FF74F
P 2050 2150
F 0 "L1" V 2240 2150 50  0000 C CNN
F 1 "2u2" V 2149 2150 50  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_HCI-1040" H 2050 2150 50  0001 C CNN
F 3 "" H 2050 2150 50  0001 C CNN
F 4 "MWSA1004-2R2MT" V 2000 2150 50  0000 C CNN "Model"
F 5 "C149550" V 2050 2150 50  0001 C CNN "LCSC"
	1    2050 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F?
U 1 1 60102113
P 9900 4950
AR Path="/60102113" Ref="F?"  Part="1" 
AR Path="/600F65F0/60102113" Ref="F1"  Part="1" 
F 0 "F1" H 9960 4996 50  0000 L CNN
F 1 "Fuse 15A" H 9960 4905 50  0000 L CNN
F 2 "Fuse:Fuse_1206_3216Metric" V 9830 4950 50  0001 C CNN
F 3 "~" H 9900 4950 50  0001 C CNN
F 4 "C182976" H 9900 4950 50  0001 C CNN "LCSC"
	1    9900 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C47
U 1 1 60101AE5
P 4650 2000
F 0 "C47" H 4765 2046 50  0000 L CNN
F 1 "100n" H 4765 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 1850 50  0001 C CNN
F 3 "~" H 4650 2000 50  0001 C CNN
F 4 "C14663" H 4650 2000 50  0001 C CNN "LCSC"
	1    4650 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 601028D8
P 2350 1950
F 0 "R18" H 2420 1996 50  0000 L CNN
F 1 "240K" H 2420 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 1950 50  0001 C CNN
F 3 "~" H 2350 1950 50  0001 C CNN
F 4 "C4197" H 2350 1950 50  0001 C CNN "LCSC"
	1    2350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2150 2350 2100
Connection ~ 3100 2150
Wire Wire Line
	2350 1800 2350 1750
Wire Wire Line
	2350 1750 3100 1750
Text Notes 5350 800  0    39   Italic 0
11,3mS SoftStart time for 47nF capacitor,\n24,08mS SoftStart time for 100nF capacitor\nt=(1,204V*C)/5uA
Wire Wire Line
	4650 1850 4500 1850
$Comp
L power:+BATT #PWR0160
U 1 1 60106E8A
P 1700 950
F 0 "#PWR0160" H 1700 800 50  0001 C CNN
F 1 "+BATT" H 1715 1123 50  0000 C CNN
F 2 "" H 1700 950 50  0001 C CNN
F 3 "" H 1700 950 50  0001 C CNN
	1    1700 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2250 3100 2350
Wire Wire Line
	4500 1050 4500 1150
Wire Wire Line
	4500 2850 4500 3000
Wire Wire Line
	1700 950  1700 2150
Wire Wire Line
	1700 2150 1900 2150
Connection ~ 2350 2150
Wire Wire Line
	2350 2150 3100 2150
Wire Wire Line
	2200 2150 2350 2150
Wire Wire Line
	4500 2350 4500 2450
Connection ~ 4500 2850
Connection ~ 4500 2450
Wire Wire Line
	4500 2450 4500 2750
Connection ~ 4500 2750
Wire Wire Line
	4500 2750 4500 2850
Wire Wire Line
	3100 2450 3100 2350
Connection ~ 3100 2350
$Comp
L Device:C C50
U 1 1 6010A910
P 3850 3250
F 0 "C50" V 3598 3250 50  0000 C CNN
F 1 "100n" V 3689 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3888 3100 50  0001 C CNN
F 3 "~" H 3850 3250 50  0001 C CNN
F 4 "C14663" H 3850 3250 50  0001 C CNN "LCSC"
	1    3850 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3250 3100 3250
Wire Wire Line
	3100 3250 3100 2450
Connection ~ 3100 2450
$Comp
L Device:R R15
U 1 1 6010C004
P 5450 1550
F 0 "R15" V 5243 1550 50  0000 C CNN
F 1 "24K" V 5334 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5380 1550 50  0001 C CNN
F 3 "~" H 5450 1550 50  0001 C CNN
F 4 "C23352" H 5450 1550 50  0001 C CNN "LCSC"
	1    5450 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1550 4500 1550
$Comp
L Device:C C41
U 1 1 6010D31B
P 5750 1550
F 0 "C41" V 5498 1550 50  0000 C CNN
F 1 "1n" V 5589 1550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 1400 50  0001 C CNN
F 3 "~" H 5750 1550 50  0001 C CNN
F 4 "C1588" H 5750 1550 50  0001 C CNN "LCSC"
	1    5750 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 6010EFD1
P 5900 1550
F 0 "#PWR0165" H 5900 1300 50  0001 C CNN
F 1 "GND" H 5905 1377 50  0000 C CNN
F 2 "" H 5900 1550 50  0001 C CNN
F 3 "" H 5900 1550 50  0001 C CNN
	1    5900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1250 4500 1150
Connection ~ 4500 1150
$Comp
L Device:C C39
U 1 1 6010FCA9
P 4650 950
F 0 "C39" V 4398 950 50  0000 C CNN
F 1 "1u" V 4489 950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 800 50  0001 C CNN
F 3 "~" H 4650 950 50  0001 C CNN
F 4 "C15849" H 4650 950 50  0001 C CNN "LCSC"
	1    4650 950 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 60110384
P 4800 950
F 0 "#PWR0162" H 4800 700 50  0001 C CNN
F 1 "GND" H 4805 777 50  0000 C CNN
F 2 "" H 4800 950 50  0001 C CNN
F 3 "" H 4800 950 50  0001 C CNN
	1    4800 950 
	1    0    0    -1  
$EndComp
Text Notes 1900 2400 0    39   Italic 0
Idc=13A\nIsat=13A
$Comp
L Device:R R16
U 1 1 60115074
P 4750 1750
F 0 "R16" V 4650 1650 50  0000 C CNN
F 1 "150K" V 4634 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 1750 50  0001 C CNN
F 3 "~" H 4750 1750 50  0001 C CNN
F 4 "C22807" H 4750 1750 50  0001 C CNN "LCSC"
	1    4750 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 1750 4500 1750
$Comp
L power:GND #PWR0177
U 1 1 6011603A
P 4900 3000
F 0 "#PWR0177" H 4900 2750 50  0001 C CNN
F 1 "GND" H 4905 2827 50  0000 C CNN
F 2 "" H 4900 3000 50  0001 C CNN
F 3 "" H 4900 3000 50  0001 C CNN
	1    4900 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C49
U 1 1 60117FA5
P 6950 2200
F 0 "C49" H 7068 2246 50  0000 L CNN
F 1 "1000u 16V" H 7068 2155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 6988 2050 50  0001 C CNN
F 3 "~" H 6950 2200 50  0001 C CNN
F 4 "C43348" H 6950 2200 50  0001 C CNN "LCSC"
	1    6950 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1150 6200 1150
Wire Wire Line
	6950 1150 6950 2050
Wire Wire Line
	6950 2350 6950 3000
$Comp
L power:GND #PWR0180
U 1 1 60119FAC
P 6950 3000
F 0 "#PWR0180" H 6950 2750 50  0001 C CNN
F 1 "GND" H 6955 2827 50  0000 C CNN
F 2 "" H 6950 3000 50  0001 C CNN
F 3 "" H 6950 3000 50  0001 C CNN
	1    6950 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0176
U 1 1 60186B95
P 4650 3000
F 0 "#PWR0176" H 4650 2750 50  0001 C CNN
F 1 "GND" H 4655 2827 50  0000 C CNN
F 2 "" H 4650 3000 50  0001 C CNN
F 3 "" H 4650 3000 50  0001 C CNN
	1    4650 3000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW3
U 1 1 601AE869
P 9900 4500
F 0 "SW3" V 9946 4312 50  0000 R CNN
F 1 "MT-102" V 9855 4312 50  0000 R CNN
F 2 "Sergej_Library:TE_A101SYCQ04" H 9900 4500 50  0001 C CNN
F 3 "~" H 9900 4500 50  0001 C CNN
	1    9900 4500
	0    -1   -1   0   
$EndComp
$Comp
L power:+BATT #PWR0181
U 1 1 601AF225
P 9800 4300
F 0 "#PWR0181" H 9800 4150 50  0001 C CNN
F 1 "+BATT" H 9815 4473 50  0000 C CNN
F 2 "" H 9800 4300 50  0001 C CNN
F 3 "" H 9800 4300 50  0001 C CNN
	1    9800 4300
	1    0    0    -1  
$EndComp
$Comp
L Sergej_Library:TP4056 IC1
U 1 1 601B09A8
P 8650 5050
F 0 "IC1" H 8650 5617 50  0000 C CNN
F 1 "TP4056" H 8650 5526 50  0000 C CNN
F 2 "Package_SO:SOIC-8-1EP_3.9x4.9mm_P1.27mm_EP2.514x3.2mm_ThermalVias" H 8650 5050 50  0001 L BNN
F 3 "" H 8650 5050 50  0001 C CNN
F 4 "C16581" H 8650 5050 50  0001 C CNN "LCSC"
	1    8650 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 601B1BC0
P 7300 4900
F 0 "D3" H 7350 4800 50  0000 R CNN
F 1 "LED_GREEN" H 7450 4700 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 7300 4900 50  0001 C CNN
F 3 "~" H 7300 4900 50  0001 C CNN
	1    7300 4900
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 601B2EB6
P 7600 4900
F 0 "D4" H 7639 4782 50  0000 R CNN
F 1 "LED_RED" H 7750 4700 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 7600 4900 50  0001 C CNN
F 3 "~" H 7600 4900 50  0001 C CNN
	1    7600 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8050 5050 7600 5050
Wire Wire Line
	8050 5150 7300 5150
Wire Wire Line
	7300 5150 7300 5050
$Comp
L Device:R R20
U 1 1 601B46E2
P 7300 4600
F 0 "R20" H 7370 4646 50  0000 L CNN
F 1 "1K" H 7370 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 4600 50  0001 C CNN
F 3 "~" H 7300 4600 50  0001 C CNN
F 4 "C21190" H 7300 4600 50  0001 C CNN "LCSC"
	1    7300 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 601B49E3
P 7600 4600
F 0 "R21" H 7670 4646 50  0000 L CNN
F 1 "1K" H 7670 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7530 4600 50  0001 C CNN
F 3 "~" H 7600 4600 50  0001 C CNN
F 4 "C21190" H 7600 4600 50  0001 C CNN "LCSC"
	1    7600 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 60193CF4
P 2450 5850
AR Path="/6018ABDD/60193CF4" Ref="Q?"  Part="1" 
AR Path="/600F65F0/60193CF4" Ref="Q5"  Part="1" 
F 0 "Q5" H 2640 5896 50  0000 L CNN
F 1 "S8050" H 2640 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2650 5950 50  0001 C CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Changjiang-Electronics-Tech-CJ-S8050_C2146.pdf" H 2450 5850 50  0001 C CNN
F 4 "C2146" H 2450 5850 50  0001 C CNN "LCSC"
	1    2450 5850
	1    0    0    -1  
$EndComp
Text Notes 5200 950  0    39   ~ 0
ENable pin internal pull-down resistance = 800K
$Comp
L Device:R R26
U 1 1 6019ECF3
P 2100 5450
F 0 "R26" V 1893 5450 50  0000 C CNN
F 1 "10M" V 1984 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 5450 50  0001 C CNN
F 3 "~" H 2100 5450 50  0001 C CNN
F 4 "C7250" H 2100 5450 50  0001 C CNN "LCSC"
	1    2100 5450
	-1   0    0    1   
$EndComp
$Comp
L Device:C C58
U 1 1 6019F631
P 2100 6050
F 0 "C58" H 2215 6096 50  0000 L CNN
F 1 "100n" H 2215 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2138 5900 50  0001 C CNN
F 3 "~" H 2100 6050 50  0001 C CNN
F 4 "C14663" H 2100 6050 50  0001 C CNN "LCSC"
	1    2100 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5850 2100 5600
Wire Wire Line
	2100 5850 2100 5900
$Comp
L power:GND #PWR0207
U 1 1 601A0F41
P 2100 6350
F 0 "#PWR0207" H 2100 6100 50  0001 C CNN
F 1 "GND" H 2105 6177 50  0000 C CNN
F 2 "" H 2100 6350 50  0001 C CNN
F 3 "" H 2100 6350 50  0001 C CNN
	1    2100 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0208
U 1 1 601A1C23
P 2550 6350
F 0 "#PWR0208" H 2550 6100 50  0001 C CNN
F 1 "GND" H 2555 6177 50  0000 C CNN
F 2 "" H 2550 6350 50  0001 C CNN
F 3 "" H 2550 6350 50  0001 C CNN
	1    2550 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 6350 2550 6050
$Comp
L Device:R R24
U 1 1 601A4174
P 2550 5400
F 0 "R24" V 2343 5400 50  0000 C CNN
F 1 "51K" V 2434 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2480 5400 50  0001 C CNN
F 3 "~" H 2550 5400 50  0001 C CNN
F 4 "C23196" H 2550 5400 50  0001 C CNN "LCSC"
	1    2550 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 5650 2550 5600
$Comp
L power:+BATT #PWR0192
U 1 1 601A50E0
P 2550 5100
F 0 "#PWR0192" H 2550 4950 50  0001 C CNN
F 1 "+BATT" H 2565 5273 50  0000 C CNN
F 2 "" H 2550 5100 50  0001 C CNN
F 3 "" H 2550 5100 50  0001 C CNN
	1    2550 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5250 2550 5100
$Comp
L Device:C C48
U 1 1 601A5EBF
P 6500 2200
F 0 "C48" H 6615 2246 50  0000 L CNN
F 1 "100n" H 6615 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6538 2050 50  0001 C CNN
F 3 "~" H 6500 2200 50  0001 C CNN
F 4 "C14663" H 6500 2200 50  0001 C CNN "LCSC"
	1    6500 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 601A639F
P 6200 1750
F 0 "R17" V 6100 1650 50  0000 C CNN
F 1 "270K" V 6084 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6130 1750 50  0001 C CNN
F 3 "~" H 6200 1750 50  0001 C CNN
F 4 "C22965" H 6200 1750 50  0001 C CNN "LCSC"
	1    6200 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 601A9FFC
P 6200 2550
F 0 "R19" V 6100 2450 50  0000 C CNN
F 1 "30K" V 6084 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6130 2550 50  0001 C CNN
F 3 "~" H 6200 2550 50  0001 C CNN
F 4 "C22984" H 6200 2550 50  0001 C CNN "LCSC"
	1    6200 2550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0179
U 1 1 601AA648
P 6500 3000
F 0 "#PWR0179" H 6500 2750 50  0001 C CNN
F 1 "GND" H 6505 2827 50  0000 C CNN
F 2 "" H 6500 3000 50  0001 C CNN
F 3 "" H 6500 3000 50  0001 C CNN
	1    6500 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0178
U 1 1 601AAB44
P 6200 3000
F 0 "#PWR0178" H 6200 2750 50  0001 C CNN
F 1 "GND" H 6205 2827 50  0000 C CNN
F 2 "" H 6200 3000 50  0001 C CNN
F 3 "" H 6200 3000 50  0001 C CNN
	1    6200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1600 6200 1150
Connection ~ 6200 1150
Wire Wire Line
	6200 1150 6500 1150
Wire Wire Line
	6500 2050 6500 1150
Connection ~ 6500 1150
Wire Wire Line
	6500 1150 6950 1150
Wire Wire Line
	6500 2350 6500 3000
Wire Wire Line
	6200 3000 6200 2700
Wire Wire Line
	6200 2400 6200 2250
Wire Wire Line
	4500 1450 5000 1450
Wire Wire Line
	5000 1450 5000 3250
Wire Wire Line
	5000 3250 4000 3250
Wire Wire Line
	6200 2250 6000 2250
Wire Wire Line
	6000 2250 6000 3400
Wire Wire Line
	6000 3400 2550 3400
Wire Wire Line
	2550 3400 2550 1550
Wire Wire Line
	2550 1550 3100 1550
Connection ~ 6200 2250
Wire Wire Line
	6200 2250 6200 1900
Wire Wire Line
	4650 2150 4650 3000
Wire Wire Line
	4900 1750 4900 3000
$Comp
L power:+BATT #PWR0191
U 1 1 601C6028
P 2100 5100
F 0 "#PWR0191" H 2100 4950 50  0001 C CNN
F 1 "+BATT" H 2115 5273 50  0000 C CNN
F 2 "" H 2100 5100 50  0001 C CNN
F 3 "" H 2100 5100 50  0001 C CNN
	1    2100 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5100 2100 5300
$Comp
L Regulator_Linear:AMS1117-3.3 U4
U 1 1 601CA936
P 9450 1700
F 0 "U4" H 9450 1942 50  0000 C CNN
F 1 "AMS1117-3.3" H 9450 1851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9450 1900 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 9550 1450 50  0001 C CNN
F 4 "C6186" H 9450 1700 50  0001 C CNN "LCSC"
	1    9450 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6350 2100 6200
Connection ~ 2100 5850
Wire Wire Line
	2100 5850 2250 5850
Wire Wire Line
	2100 5850 2050 5850
Text HLabel 2050 5850 0    50   Input ~ 0
5V_ENABLE
Wire Wire Line
	1250 1750 1250 950 
Wire Wire Line
	1250 3000 1250 2050
$Comp
L power:GND #PWR0174
U 1 1 601C9D81
P 1250 3000
F 0 "#PWR0174" H 1250 2750 50  0001 C CNN
F 1 "GND" H 1255 2827 50  0000 C CNN
F 2 "" H 1250 3000 50  0001 C CNN
F 3 "" H 1250 3000 50  0001 C CNN
	1    1250 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0159
U 1 1 601C9964
P 1250 950
F 0 "#PWR0159" H 1250 800 50  0001 C CNN
F 1 "+BATT" H 1265 1123 50  0000 C CNN
F 2 "" H 1250 950 50  0001 C CNN
F 3 "" H 1250 950 50  0001 C CNN
	1    1250 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 60186069
P 1250 1900
F 0 "D7" V 1204 1980 50  0000 L CNN
F 1 "B5819W" V 1295 1980 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 1250 1900 50  0001 C CNN
F 3 "~" H 1250 1900 50  0001 C CNN
F 4 "C8598" V 1250 1900 50  0001 C CNN "LCSC"
	1    1250 1900
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60210686
P 8850 1850
AR Path="/60171EF5/60210686" Ref="C?"  Part="1" 
AR Path="/600F65F0/60210686" Ref="C43"  Part="1" 
F 0 "C43" H 8965 1896 50  0000 L CNN
F 1 "10u" H 8965 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8888 1700 50  0001 C CNN
F 3 "~" H 8850 1850 50  0001 C CNN
F 4 "C15850" H 8850 1850 50  0001 C CNN "LCSC"
	1    8850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C42
U 1 1 60210EE6
P 8450 1850
F 0 "C42" H 8565 1896 50  0000 L CNN
F 1 "100n" H 8565 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8488 1700 50  0001 C CNN
F 3 "~" H 8450 1850 50  0001 C CNN
F 4 "C14663" H 8450 1850 50  0001 C CNN "LCSC"
	1    8450 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C44
U 1 1 602114BF
P 9950 1850
F 0 "C44" H 10065 1896 50  0000 L CNN
F 1 "100n" H 10065 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9988 1700 50  0001 C CNN
F 3 "~" H 9950 1850 50  0001 C CNN
F 4 "C14663" H 9950 1850 50  0001 C CNN "LCSC"
	1    9950 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C45
U 1 1 6019B83C
P 10400 1850
F 0 "C45" H 10518 1896 50  0000 L CNN
F 1 "100u" H 10518 1805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 10438 1700 50  0001 C CNN
F 3 "~" H 10400 1850 50  0001 C CNN
F 4 "C43803" H 10400 1850 50  0001 C CNN "LCSC"
	1    10400 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0196
U 1 1 601ABC27
P 8650 5650
F 0 "#PWR0196" H 8650 5400 50  0001 C CNN
F 1 "GND" H 8655 5477 50  0000 C CNN
F 2 "" H 8650 5650 50  0001 C CNN
F 3 "" H 8650 5650 50  0001 C CNN
	1    8650 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0197
U 1 1 601ABE78
P 8750 5650
F 0 "#PWR0197" H 8750 5400 50  0001 C CNN
F 1 "GND" H 8755 5477 50  0000 C CNN
F 2 "" H 8750 5650 50  0001 C CNN
F 3 "" H 8750 5650 50  0001 C CNN
	1    8750 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0200
U 1 1 601ABFFB
P 9900 5650
F 0 "#PWR0200" H 9900 5400 50  0001 C CNN
F 1 "GND" H 9905 5477 50  0000 C CNN
F 2 "" H 9900 5650 50  0001 C CNN
F 3 "" H 9900 5650 50  0001 C CNN
	1    9900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4750 8050 4850
Connection ~ 8050 4750
Wire Wire Line
	9900 4700 9900 4750
Wire Wire Line
	9900 4750 9250 4750
Connection ~ 9900 4750
Wire Wire Line
	9900 4750 9900 4800
$Comp
L Device:R R25
U 1 1 601B15E1
P 9250 5400
F 0 "R25" V 9150 5300 50  0000 C CNN
F 1 "1K2" V 9150 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9180 5400 50  0001 C CNN
F 3 "~" H 9250 5400 50  0001 C CNN
F 4 "C22765" H 9250 5400 50  0001 C CNN "LCSC"
	1    9250 5400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0198
U 1 1 601B20FA
P 9250 5650
F 0 "#PWR0198" H 9250 5400 50  0001 C CNN
F 1 "GND" H 9255 5477 50  0000 C CNN
F 2 "" H 9250 5650 50  0001 C CNN
F 3 "" H 9250 5650 50  0001 C CNN
	1    9250 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0199
U 1 1 601B2522
P 9400 5650
F 0 "#PWR0199" H 9400 5400 50  0001 C CNN
F 1 "GND" H 9405 5477 50  0000 C CNN
F 2 "" H 9400 5650 50  0001 C CNN
F 3 "" H 9400 5650 50  0001 C CNN
	1    9400 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5650 9400 5050
Wire Wire Line
	9400 5050 9250 5050
Wire Wire Line
	9250 5150 9250 5250
Wire Wire Line
	9250 5550 9250 5650
Wire Wire Line
	9900 5650 9900 5400
Wire Wire Line
	9750 1700 9950 1700
Connection ~ 9950 1700
Wire Wire Line
	9950 1700 10400 1700
$Comp
L power:+12V #PWR0163
U 1 1 601BBB12
P 6950 1150
F 0 "#PWR0163" H 6950 1000 50  0001 C CNN
F 1 "+12V" H 6965 1323 50  0000 C CNN
F 2 "" H 6950 1150 50  0001 C CNN
F 3 "" H 6950 1150 50  0001 C CNN
	1    6950 1150
	1    0    0    -1  
$EndComp
Connection ~ 6950 1150
$Comp
L power:GND #PWR0170
U 1 1 601BCBF4
P 9450 2000
F 0 "#PWR0170" H 9450 1750 50  0001 C CNN
F 1 "GND" H 9455 1827 50  0000 C CNN
F 2 "" H 9450 2000 50  0001 C CNN
F 3 "" H 9450 2000 50  0001 C CNN
	1    9450 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0171
U 1 1 601BCEF7
P 9950 2000
F 0 "#PWR0171" H 9950 1750 50  0001 C CNN
F 1 "GND" H 9955 1827 50  0000 C CNN
F 2 "" H 9950 2000 50  0001 C CNN
F 3 "" H 9950 2000 50  0001 C CNN
	1    9950 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0172
U 1 1 601BD23F
P 10400 2000
F 0 "#PWR0172" H 10400 1750 50  0001 C CNN
F 1 "GND" H 10405 1827 50  0000 C CNN
F 2 "" H 10400 2000 50  0001 C CNN
F 3 "" H 10400 2000 50  0001 C CNN
	1    10400 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0169
U 1 1 601BD3B8
P 8850 2000
F 0 "#PWR0169" H 8850 1750 50  0001 C CNN
F 1 "GND" H 8855 1827 50  0000 C CNN
F 2 "" H 8850 2000 50  0001 C CNN
F 3 "" H 8850 2000 50  0001 C CNN
	1    8850 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 601BD57B
P 8450 2000
F 0 "#PWR0168" H 8450 1750 50  0001 C CNN
F 1 "GND" H 8455 1827 50  0000 C CNN
F 2 "" H 8450 2000 50  0001 C CNN
F 3 "" H 8450 2000 50  0001 C CNN
	1    8450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 1700 8850 1700
Connection ~ 8850 1700
Wire Wire Line
	8850 1700 8450 1700
$Comp
L power:+3V3 #PWR0167
U 1 1 601BFA91
P 10400 1700
F 0 "#PWR0167" H 10400 1550 50  0001 C CNN
F 1 "+3V3" H 10415 1873 50  0000 C CNN
F 2 "" H 10400 1700 50  0001 C CNN
F 3 "" H 10400 1700 50  0001 C CNN
	1    10400 1700
	1    0    0    -1  
$EndComp
Connection ~ 10400 1700
$Comp
L power:+BATT #PWR0161
U 1 1 601C9BC2
P 3100 950
F 0 "#PWR0161" H 3100 800 50  0001 C CNN
F 1 "+BATT" H 3115 1123 50  0000 C CNN
F 2 "" H 3100 950 50  0001 C CNN
F 3 "" H 3100 950 50  0001 C CNN
	1    3100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1450 2900 1450
Text HLabel 2900 1450 0    50   Input ~ 0
12V_ENABLE
Wire Wire Line
	8050 4450 8050 4750
Wire Wire Line
	6900 4450 6900 4900
$Comp
L power:GND #PWR0195
U 1 1 601D123A
P 6900 5650
F 0 "#PWR0195" H 6900 5400 50  0001 C CNN
F 1 "GND" H 6905 5477 50  0000 C CNN
F 2 "" H 6900 5650 50  0001 C CNN
F 3 "" H 6900 5650 50  0001 C CNN
	1    6900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5650 6900 5200
$Comp
L Regulator_Switching:MT3608 U6
U 1 1 601D5CEA
P 3650 5800
F 0 "U6" H 3650 6167 50  0000 C CNN
F 1 "MT3608" H 3650 6076 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 3700 5550 50  0001 L CIN
F 3 "https://www.olimex.com/Products/Breadboarding/BB-PWR-3608/resources/MT3608.pdf" H 3400 6250 50  0001 C CNN
F 4 "C84817" H 3650 5800 50  0001 C CNN "LCSC"
	1    3650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5100 1000 5500
$Comp
L power:+BATT #PWR0189
U 1 1 601DFE97
P 1000 5100
F 0 "#PWR0189" H 1000 4950 50  0001 C CNN
F 1 "+BATT" H 1015 5273 50  0000 C CNN
F 2 "" H 1000 5100 50  0001 C CNN
F 3 "" H 1000 5100 50  0001 C CNN
	1    1000 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0205
U 1 1 601DFE90
P 1000 6350
F 0 "#PWR0205" H 1000 6100 50  0001 C CNN
F 1 "GND" H 1005 6177 50  0000 C CNN
F 2 "" H 1000 6350 50  0001 C CNN
F 3 "" H 1000 6350 50  0001 C CNN
	1    1000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5800 1000 6350
$Comp
L power:+BATT #PWR0182
U 1 1 601F167E
P 750 950
F 0 "#PWR0182" H 750 800 50  0001 C CNN
F 1 "+BATT" H 765 1123 50  0000 C CNN
F 2 "" H 750 950 50  0001 C CNN
F 3 "" H 750 950 50  0001 C CNN
	1    750  950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0201
U 1 1 601F1D96
P 750 3000
F 0 "#PWR0201" H 750 2750 50  0001 C CNN
F 1 "GND" H 755 2827 50  0000 C CNN
F 2 "" H 750 3000 50  0001 C CNN
F 3 "" H 750 3000 50  0001 C CNN
	1    750  3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  3000 750  2150
Wire Wire Line
	750  1850 750  950 
$Comp
L power:+5V #PWR0166
U 1 1 601F94B6
P 8450 1700
F 0 "#PWR0166" H 8450 1550 50  0001 C CNN
F 1 "+5V" H 8465 1873 50  0000 C CNN
F 2 "" H 8450 1700 50  0001 C CNN
F 3 "" H 8450 1700 50  0001 C CNN
	1    8450 1700
	1    0    0    -1  
$EndComp
Connection ~ 8450 1700
Wire Notes Line width 12
	7600 3700 7600 500 
Text Notes 3150 3650 0    100  ~ 20
Battery to 12V Boost converter\n
$Comp
L power:+BATT #PWR0193
U 1 1 60267D6E
P 3350 5100
F 0 "#PWR0193" H 3350 4950 50  0001 C CNN
F 1 "+BATT" H 3365 5273 50  0000 C CNN
F 2 "" H 3350 5100 50  0001 C CNN
F 3 "" H 3350 5100 50  0001 C CNN
	1    3350 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 5100 3350 5350
Wire Wire Line
	2550 5600 3050 5600
Wire Wire Line
	3050 5600 3050 5900
Wire Wire Line
	3050 5900 3350 5900
Connection ~ 2550 5600
Wire Wire Line
	2550 5600 2550 5550
$Comp
L power:GND #PWR0209
U 1 1 6026D174
P 3650 6350
F 0 "#PWR0209" H 3650 6100 50  0001 C CNN
F 1 "GND" H 3655 6177 50  0000 C CNN
F 2 "" H 3650 6350 50  0001 C CNN
F 3 "" H 3650 6350 50  0001 C CNN
	1    3650 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6350 3650 6100
$Comp
L Device:L L2
U 1 1 602705AA
P 3650 5350
F 0 "L2" V 3840 5350 50  0000 C CNN
F 1 "22uH" V 3749 5350 50  0000 C CNN
F 2 "Inductor_SMD:L_Wuerth_HCI-1040" H 3650 5350 50  0001 C CNN
F 3 "~" H 3650 5350 50  0001 C CNN
F 4 "C182173" V 3650 5350 50  0001 C CNN "LCSC"
	1    3650 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 5350 3350 5350
Connection ~ 3350 5350
Wire Wire Line
	3350 5350 3350 5700
Wire Wire Line
	3800 5350 3950 5350
Wire Wire Line
	3950 5350 3950 5700
$Comp
L Device:D_Schottky D12
U 1 1 60277535
P 4200 5350
F 0 "D12" H 4200 5133 50  0000 C CNN
F 1 "SS34" H 4200 5224 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 4200 5350 50  0001 C CNN
F 3 "~" H 4200 5350 50  0001 C CNN
F 4 "C8678" H 4200 5350 50  0001 C CNN "LCSC"
	1    4200 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 5350 3950 5350
Connection ~ 3950 5350
$Comp
L Device:R R27
U 1 1 6027A75C
P 4550 5700
F 0 "R27" V 4450 5600 50  0000 C CNN
F 1 "220K" V 4434 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4480 5700 50  0001 C CNN
F 3 "~" H 4550 5700 50  0001 C CNN
F 4 "C22961" H 4550 5700 50  0001 C CNN "LCSC"
	1    4550 5700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R28
U 1 1 6027B1FE
P 4550 6150
F 0 "R28" V 4450 6050 50  0000 C CNN
F 1 "30K" V 4434 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4480 6150 50  0001 C CNN
F 3 "~" H 4550 6150 50  0001 C CNN
F 4 "C22984" H 4550 6150 50  0001 C CNN "LCSC"
	1    4550 6150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0210
U 1 1 6027B8E9
P 4550 6350
F 0 "#PWR0210" H 4550 6100 50  0001 C CNN
F 1 "GND" H 4555 6177 50  0000 C CNN
F 2 "" H 4550 6350 50  0001 C CNN
F 3 "" H 4550 6350 50  0001 C CNN
	1    4550 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6350 4550 6300
Wire Wire Line
	4550 6000 4550 5900
Wire Wire Line
	4350 5350 4550 5350
Wire Wire Line
	4550 5350 4550 5550
Wire Wire Line
	4550 5900 3950 5900
Connection ~ 4550 5900
Wire Wire Line
	4550 5900 4550 5850
$Comp
L Device:C C56
U 1 1 602934DE
P 4800 5900
F 0 "C56" H 4915 5946 50  0000 L CNN
F 1 "100n" H 4915 5855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4838 5750 50  0001 C CNN
F 3 "~" H 4800 5900 50  0001 C CNN
F 4 "C14663" H 4800 5900 50  0001 C CNN "LCSC"
	1    4800 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5750 5250 5350
Wire Wire Line
	5250 5350 4800 5350
Connection ~ 4550 5350
Wire Wire Line
	4800 5750 4800 5350
Connection ~ 4800 5350
Wire Wire Line
	4800 5350 4550 5350
$Comp
L power:GND #PWR0211
U 1 1 6029C416
P 4800 6350
F 0 "#PWR0211" H 4800 6100 50  0001 C CNN
F 1 "GND" H 4805 6177 50  0000 C CNN
F 2 "" H 4800 6350 50  0001 C CNN
F 3 "" H 4800 6350 50  0001 C CNN
	1    4800 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0212
U 1 1 6029C5B7
P 5250 6350
F 0 "#PWR0212" H 5250 6100 50  0001 C CNN
F 1 "GND" H 5255 6177 50  0000 C CNN
F 2 "" H 5250 6350 50  0001 C CNN
F 3 "" H 5250 6350 50  0001 C CNN
	1    5250 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6350 5250 6050
Wire Wire Line
	4800 6050 4800 6350
Wire Wire Line
	5250 5350 5250 5100
Connection ~ 5250 5350
$Comp
L power:+5V #PWR0194
U 1 1 602A6EB7
P 5250 5100
F 0 "#PWR0194" H 5250 4950 50  0001 C CNN
F 1 "+5V" H 5265 5273 50  0000 C CNN
F 2 "" H 5250 5100 50  0001 C CNN
F 3 "" H 5250 5100 50  0001 C CNN
	1    5250 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0184
U 1 1 602A830D
P 6900 4450
F 0 "#PWR0184" H 6900 4300 50  0001 C CNN
F 1 "+5VP" H 6915 4623 50  0000 C CNN
F 2 "" H 6900 4450 50  0001 C CNN
F 3 "" H 6900 4450 50  0001 C CNN
	1    6900 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0185
U 1 1 602A8D4D
P 7300 4450
F 0 "#PWR0185" H 7300 4300 50  0001 C CNN
F 1 "+5VP" H 7315 4623 50  0000 C CNN
F 2 "" H 7300 4450 50  0001 C CNN
F 3 "" H 7300 4450 50  0001 C CNN
	1    7300 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0186
U 1 1 602A8F88
P 7600 4450
F 0 "#PWR0186" H 7600 4300 50  0001 C CNN
F 1 "+5VP" H 7615 4623 50  0000 C CNN
F 2 "" H 7600 4450 50  0001 C CNN
F 3 "" H 7600 4450 50  0001 C CNN
	1    7600 4450
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0187
U 1 1 602A9282
P 8050 4450
F 0 "#PWR0187" H 8050 4300 50  0001 C CNN
F 1 "+5VP" H 8065 4623 50  0000 C CNN
F 2 "" H 8050 4450 50  0001 C CNN
F 3 "" H 8050 4450 50  0001 C CNN
	1    8050 4450
	1    0    0    -1  
$EndComp
Text Notes 9200 3650 0    100  ~ 20
5V to 3,3V
Wire Notes Line width 12
	11200 6500 6200 6500
Wire Notes Line width 12
	500  3700 11200 3700
Wire Notes Line width 12
	500  500  11200 500 
Wire Notes Line width 12
	6200 7750 500  7750
Wire Notes Line width 12
	6200 3700 6200 7750
Text Notes 2700 7700 0    100  ~ 20
Battery to 5V Boost converter
Text Notes 8050 6450 0    100  ~ 20
Charging from USB-C
Wire Notes Line width 12
	500  500  500  7750
Wire Notes Line width 12
	11200 500  11200 6500
$Comp
L Device:R R22
U 1 1 6032DA96
P 10500 4650
F 0 "R22" H 10570 4696 50  0000 L CNN
F 1 "1M" H 10570 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 4650 50  0001 C CNN
F 3 "~" H 10500 4650 50  0001 C CNN
F 4 "C22935" H 10500 4650 50  0001 C CNN "LCSC"
	1    10500 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0183
U 1 1 6032E066
P 10500 4300
F 0 "#PWR0183" H 10500 4150 50  0001 C CNN
F 1 "+BATT" H 10515 4473 50  0000 C CNN
F 2 "" H 10500 4300 50  0001 C CNN
F 3 "" H 10500 4300 50  0001 C CNN
	1    10500 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 6032ED4C
P 10500 5350
F 0 "R23" H 10570 5396 50  0000 L CNN
F 1 "3M" H 10570 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10430 5350 50  0001 C CNN
F 3 "~" H 10500 5350 50  0001 C CNN
F 4 "C23156" H 10500 5350 50  0001 C CNN "LCSC"
	1    10500 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0202
U 1 1 6032F2BA
P 10500 5650
F 0 "#PWR0202" H 10500 5400 50  0001 C CNN
F 1 "GND" H 10505 5477 50  0000 C CNN
F 2 "" H 10500 5650 50  0001 C CNN
F 3 "" H 10500 5650 50  0001 C CNN
	1    10500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 5650 10500 5500
Wire Wire Line
	10500 5200 10500 4800
Wire Wire Line
	10500 4500 10500 4300
$Comp
L Device:C C53
U 1 1 6033A517
P 10850 5350
F 0 "C53" H 10965 5396 50  0000 L CNN
F 1 "100n" H 10965 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10888 5200 50  0001 C CNN
F 3 "~" H 10850 5350 50  0001 C CNN
F 4 "C14663" H 10850 5350 50  0001 C CNN "LCSC"
	1    10850 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 5200 10500 5200
Connection ~ 10500 5200
$Comp
L power:GND #PWR0203
U 1 1 6033E7F4
P 10850 5650
F 0 "#PWR0203" H 10850 5400 50  0001 C CNN
F 1 "GND" H 10855 5477 50  0000 C CNN
F 2 "" H 10850 5650 50  0001 C CNN
F 3 "" H 10850 5650 50  0001 C CNN
	1    10850 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 5650 10850 5500
Text HLabel 10850 5200 2    50   Input ~ 0
BATT
$Comp
L Device:CP C57
U 1 1 6025608B
P 5250 5900
F 0 "C57" H 5368 5946 50  0000 L CNN
F 1 "1000u 16V" H 5300 5750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 5288 5750 50  0001 C CNN
F 3 "~" H 5250 5900 50  0001 C CNN
F 4 "C43348" H 5250 5900 50  0001 C CNN "LCSC"
	1    5250 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C52
U 1 1 60264DF0
P 750 2000
F 0 "C52" H 868 2046 50  0000 L CNN
F 1 "1000u 16V" H 800 1850 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 788 1850 50  0001 C CNN
F 3 "~" H 750 2000 50  0001 C CNN
F 4 "C43348" H 750 2000 50  0001 C CNN "LCSC"
	1    750  2000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C54
U 1 1 60266669
P 650 5650
F 0 "C54" H 768 5696 50  0000 L CNN
F 1 "100u" H 700 5550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 688 5500 50  0001 C CNN
F 3 "~" H 650 5650 50  0001 C CNN
F 4 "C43803" H 650 5650 50  0001 C CNN "LCSC"
	1    650  5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 602671B0
P 650 6350
F 0 "#PWR0204" H 650 6100 50  0001 C CNN
F 1 "GND" H 655 6177 50  0000 C CNN
F 2 "" H 650 6350 50  0001 C CNN
F 3 "" H 650 6350 50  0001 C CNN
	1    650  6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  6350 650  5800
$Comp
L power:+BATT #PWR0188
U 1 1 6026B5BE
P 650 5100
F 0 "#PWR0188" H 650 4950 50  0001 C CNN
F 1 "+BATT" H 665 5273 50  0000 C CNN
F 2 "" H 650 5100 50  0001 C CNN
F 3 "" H 650 5100 50  0001 C CNN
	1    650  5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  5100 650  5500
$Comp
L Device:CP C51
U 1 1 60271EA3
P 6900 5050
F 0 "C51" H 7018 5096 50  0000 L CNN
F 1 "100u" H 6950 4900 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6938 4900 50  0001 C CNN
F 3 "~" H 6900 5050 50  0001 C CNN
F 4 "C43803" H 6900 5050 50  0001 C CNN "LCSC"
	1    6900 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C55
U 1 1 6027330E
P 1000 5650
F 0 "C55" H 1115 5696 50  0000 L CNN
F 1 "100n" H 1050 5550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 5500 50  0001 C CNN
F 3 "~" H 1000 5650 50  0001 C CNN
F 4 "C14663" H 1000 5650 50  0001 C CNN "LCSC"
	1    1000 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C40
U 1 1 60273BB1
P 3100 1100
F 0 "C40" H 2900 1100 50  0000 L CNN
F 1 "100n" H 2900 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3138 950 50  0001 C CNN
F 3 "~" H 3100 1100 50  0001 C CNN
F 4 "C14663" H 3100 1100 50  0001 C CNN "LCSC"
	1    3100 1100
	1    0    0    -1  
$EndComp
Connection ~ 3100 950 
$Comp
L power:GND #PWR0164
U 1 1 60274721
P 3100 1250
F 0 "#PWR0164" H 3100 1000 50  0001 C CNN
F 1 "GND" H 3100 1100 50  0000 C CNN
F 2 "" H 3100 1250 50  0001 C CNN
F 3 "" H 3100 1250 50  0001 C CNN
	1    3100 1250
	1    0    0    -1  
$EndComp
NoConn ~ 10000 4300
$Comp
L Connector:Conn_01x02_Male J16
U 1 1 6058E43B
P 6450 5000
F 0 "J16" H 6558 5181 50  0000 C CNN
F 1 "Conn_01x02_Male" V 6350 4950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6450 5000 50  0001 C CNN
F 3 "~" H 6450 5000 50  0001 C CNN
	1    6450 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 6058EB07
P 6650 5650
F 0 "#PWR0117" H 6650 5400 50  0001 C CNN
F 1 "GND" H 6655 5477 50  0000 C CNN
F 2 "" H 6650 5650 50  0001 C CNN
F 3 "" H 6650 5650 50  0001 C CNN
	1    6650 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0118
U 1 1 6058EC5F
P 6650 4450
F 0 "#PWR0118" H 6650 4300 50  0001 C CNN
F 1 "+5VP" H 6665 4623 50  0000 C CNN
F 2 "" H 6650 4450 50  0001 C CNN
F 3 "" H 6650 4450 50  0001 C CNN
	1    6650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4450 6650 5000
Wire Wire Line
	6650 5100 6650 5650
$EndSCHEMATC
