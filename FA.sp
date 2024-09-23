***------------------------------------***
***          VLSI 2024 Lab01           ***
***            Full Adder  	           ***
***            student ID:             ***
***------------------------------------***  
.title vlsi FA


***-----------------------***
***        setting        ***
***-----------------------***
.lib "../../umc018.l" L18U18V_TT
.TEMP 25
.op
.options post

***-----------------------***
***      parameters       ***
***-----------------------***
.global VDD GND
.param supply=1.8v
.param load=0.1f

.param wp=0.24u 
.param wn=0.24u 

***-----------------------***
***       simulation      *** 
***-----------------------***
.tran 0.1n 60n

***-----------------------***
***      measurements     ***
***-----------------------***


***-----------------------***
***      power/input      ***
***-----------------------***
Vd1 VDD GND supply
Vd IN GND pulse(0 supply 1ns 0.1ns 0.1ns 1.9ns 4ns)

***-----------------------***
***        circuit        ***
***-----------------------***
X1 IN OUT INV
Cload  OUT  GND  load

***-----------------------***
***      sub-circuit      ***
***-----------------------***
.subckt INV IN OUT
mp1 OUT IN VDD VDD P_18_G2 l=0.18u w=wp
mn1 OUT IN GND GND N_18_G2 l=0.18u w=wn
.ends

.subckt XOR INA INB OUT
X1 INA INAR INV
X2 INB INBR INV
mpl1 OUT1 INAR VDD VDD P_18_G2 l=0.18u w=wp
mpr1 OUT2 INBR VDD VDD P_18_G2 l=0.18u w=wp
mpl2 OUT INA OUT1 OUT1 P_18_G2 l=0.18u w=wp
mpr2 OUT INB OUT2 OUT2 P_18_G2 l=0.18u w=wp
mpl4 OUT3 INA GND GND N_18_G2 l=0.18u w=wn
mpr4 OUT4 INBR GND GND N_18_G2 l=0.18u w=wn
mpl3 OUT INAR OUT3 OUT3 N_18_G2 l=0.18u w=wn
mpr3 OUT INB OUT4 OUT4 N_18_G2 l=0.18u w=wn
.ends

.subskt NAND INA INB OUT



***-----------------------***
***         alter         ***
***-----------------------***