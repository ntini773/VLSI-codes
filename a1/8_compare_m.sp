Comparing 2 w/l mosfets with a w/2l mosfet

.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd vdd

VDS D gnd 'SUPPLY'
VGS G gnd 1.8V

M1    D     G     common    gnd  CMOSN  W={width_N}  L={2*LAMBDA} 
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
M2   common    G     gnd    gnd  CMOSN  W={width_N}  L={2*LAMBDA} 
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

*M3   D    G     gnd    gnd  CMOSN  W={width_N}  L={4*LAMBDA} 
*+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.dc VDS 0 1.8 0.01V

.control
set hcopypscolor = 1
set color0=white
set color1 = black
run

let I_DS=(-VDS#branch)
plot I_DS
.endc