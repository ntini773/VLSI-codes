Finding peak Ion and average Ioff for various widths

.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd vdd

VDS D gnd 1.8
VGS G gnd 0


M1    D     G     gnd    gnd  CMOSN  W={10*width_N}  L={2*LAMBDA} 
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
.tran 1u 10u 1u
.control
set hcopypscolor = 1
set color0=white
set color1 = black

run

let I_DS=(-VDS#branch)
plot I_DS

.endc