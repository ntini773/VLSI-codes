Making CMOS Inverter and finding propagation delays

.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.18u
.param width_N={10*LAMBDA}
.param  width_P={2.5*width_N}
.global gnd 

vin a 0 pulse 0 1.8 0ns 100ps 100ps 9.9ns 20ns
VDD D gnd 'SUPPLY'
VGS G gnd 'SUPPLY'


M1N b a gnd gnd CMOSN  W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2N out b gnd gnd CMOSN   W={width_N}   L={LAMBDA}
+ AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M1P b a D D CMOSP    W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2P out b D D CMOSP   W={width_P}   L={LAMBDA}
+ AS={5*width_P*LAMBDA} PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

CL out gnd 100fF
.tran 20n 50n
** MEASURING DELAYS (Refer manual section 15.4.5)
.measure tran tpdr
+ TRIG v(a) VAL='SUPPLY/2' RISE=1
+ TARG v(out) VAL='SUPPLY/2' RISE=1
.measure tran tpdf
+ TRIG v(a) VAL='SUPPLY/2' FALL=1
+ TARG v(out) VAL='SUPPLY/2' FALL=1


.measure tran tpd param='(tpdr+tpdf)/2' goal=0
.control
set hcopypscolor = 1
set color0=white
set color1 = black

run
plot out v(a)

.endc
