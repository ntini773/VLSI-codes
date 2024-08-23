Using NMOS and PMOS as switch and analyzing

.include TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd vdd

VDS D gnd 0
VGS G gnd -1.8

C1 out gnd 10nF
M1    D    G    out   D  CMOSP  W={width_N}  L={2*LAMBDA} 
+AS={5*width_N*LAMBDA} PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
.ic v(out)=1.8
.tran 1u 10u 0u
.control
set hcopypscolor = 1
set color0=white
set color1 = black

run
plot out
.endc