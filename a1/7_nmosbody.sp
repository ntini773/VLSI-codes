.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd vdd


VGS G gnd 'SUPPLY'
VDS D gnd 1.8V
VBS B gnd -900m

M1    D     G     gnd  B   CMOSN  W={width_N}  L={2*LAMBDA} 
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
.dc VGS 0 1.8 0.001V
.measure dc current_at_slop FIND I(VDS) WHEN V(G)=0.826027

.control
set hcopypscolor = 1
set color0=white
set color1 = black
run
let I_DS=-VDS#branch
let gm = deriv(sqrt(-VDS#branch))
plot gm
plot I_DS

.endc