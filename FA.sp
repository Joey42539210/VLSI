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
.param load=10f

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
Vd VDD GND supply
Vd1 INA GND pulse(supply 0 0 0.1ns 0.1ns 1.9ns 4ns)
Vd2 INB GND pulse(supply 0 0 0.1ns 0.1ns 3.9ns 8ns)
Vd3 CIN GND pulse(supply 0 0 0.1ns 0.1ns 7.9ns 16ns)

***-----------------------***
***        circuit        ***
***-----------------------***
X1 INA INB CIN SUM COUT FA
Cload1 COUT GND load
Cload2 SUM GND load
***-----------------------***
***      sub-circuit      ***
***-----------------------***
.subckt INV IN OUT
mp1 OUT IN VDD VDD P_18_G2 l=0.18u w=wp
mn1 OUT IN GND GND N_18_G2 l=0.18u w=wn
.ends

.subckt XOR INA INB OUT
X2 INA INAR INV
X3 INB INBR INV
mpl1 OUT1 INAR VDD VDD P_18_G2 l=0.18u w=wp
mpr1 OUT1 INBR VDD VDD P_18_G2 l=0.18u w=wp
mpl2 OUT INA OUT1 VDD P_18_G2 l=0.18u w=wp
mpr2 OUT INB OUT1 VDD P_18_G2 l=0.18u w=wp
mnl3 OUT INAR OUT3 GND N_18_G2 l=0.18u w=wn
mnr3 OUT INB OUT3 GND N_18_G2 l=0.18u w=wn
mnl4 OUT3 INA GND GND N_18_G2 l=0.18u w=wn
mnr4 OUT3 INBR GND GND N_18_G2 l=0.18u w=wn

.ends

.subckt NAND INA INB OUT
mp1 OUT INB VDD VDD P_18_G2 l=0.18u w=wp
mp2 OUT INA VDD VDD P_18_G2 l=0.18u w=wp
mn2 OUT1 INB GND GND N_18_G2 l=0.18u w=wn
mn1 OUT INA OUT1 GND N_18_G2 l=0.18u w=wn
.ends

.subckt FA INA INB CIN SUM COUT
X4 INA INB OUT1 XOR
X5 OUT1 CIN SUM XOR
X6 OUT1 CIN OUT2 NAND
X7 INA INB OUT3 NAND
X8 OUT2 OUT3 COUT NAND
.ends


***-----------------------***
***         alter         ***
***-----------------------***
.alter
.param load=5pf
.param wp=0.4u 
.param wn=0.2u 
*
.alter
.param wp=0.2u 
.param wn=0.4u 
*
.alter
.param wp=0.4u 
.param wn=0.4u 
.end
