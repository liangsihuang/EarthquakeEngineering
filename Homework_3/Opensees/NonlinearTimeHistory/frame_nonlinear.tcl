wipe
# 单位制：N, mm, ton
model basic -ndm 2 -ndf 3
# 柱高, 梁跨
set h 3600.0
set l 6000.0

node 1 0.0 0.0
node 2 0.0 $h
node 3 $l $h
node 4 $l 0.0
# 6.017 is joint mass from SAP2000
# 5.905 is the manual calculated
mass 1 0.109 0.109 0.0
# mass 2 5.905 5.905 0.0
# mass 3 5.905 5.905 0.0
mass 2 6.017 6.017 0.0
mass 3 6.017 6.017 0.0
mass 4 0.109 0.109 0.0
fix 1 1 1 1
fix 4 1 1 1

uniaxialMaterial Steel01 1 345 2e5 0.01
source ISectionGenerator.tcl
ISectionGenerator 300 120 6 10 0 0 1 1 5 3 L 10 10 False False
ISectionGenerator 300 300 6 10 0 0 1 2 5 3 L 10 10 False False
geomTransf Linear 1 
set np 5
element forceBeamColumn 1 1 2 $np 2 1
element forceBeamColumn 2 2 3 $np 1 1
element forceBeamColumn 3 3 4 $np 2 1

# 竖向荷载
pattern Plain 1 Linear  {
    eleLoad -ele 2 -type -beamUniform -19
    # 没有考虑自重
}
constraints Plain
numberer Plain
system BandGeneral
test NormDispIncr 1.0e-8 6
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10
loadConst -time 0.0
