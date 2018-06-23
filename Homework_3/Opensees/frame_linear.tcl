wipe
# 单位制：N, mm, ton
puts "System"
model basic -ndm 2 -ndf 3
puts "restraint"
# 柱高, 梁跨
set h 3600.0
set l 6000.0
node 1 0.0 0.0
node 2 0.0 $h
node 3 $l $h
node 4 $l 0.0
puts "mass"
# 6.017 is joint mass from SAP2000
# 5.905 is the manual calculated
mass 1 0.109 0.109 0.0
# mass 2 5.905 5.905 0.0
# mass 3 5.905 5.905 0.0
mass 2 6.017 6.017 0.0
mass 3 6.017 6.017 0.0
mass 4 0.109 0.109 0.0
puts "node"
fix 1 1 1 1
fix 4 1 1 1
puts "material"
puts "transformation"
geomTransf Linear 1 
puts "element"
element elasticBeamColumn 1 1 2 7680.0 2.0E+5 137.176E+6 1
element elasticBeamColumn 2 2 3 4080.0 2.0E+5 61.456E+6 1
element elasticBeamColumn 3 3 4 7680.0 2.0E+5 137.176E+6 1
puts "mode and damping"
set numModes 2
set lambda [eigen  $numModes]
set omega {}
foreach lam $lambda {
    lappend omega [expr sqrt($lam)]
}
set w1 [lindex $lambda 0]
set w2 [lindex $lambda 1]
set dr 0.02
set a0 [expr 2*$dr*$w1*$w2/($w1+$w2)]
set a1 [expr 2*$dr/(($w1+$w2))]
rayleigh $a0 $a1 0 0
# rayleigh 0 [expr 2*$dr/$w1] 0 0
puts "recorder and load"
# set accelSeries "Series -dt 0.1 -filePath data_sin1.txt -factor 9.8"
# pattern UniformExcitation 1 1 -accel $accelSeries
recorder Node -file outputData/Node2disp_2.out -time -node 2 -dof 1 disp
timeSeries Path 1 -dt 0.1 -filePath data_sin2.txt -factor 9.8e3
pattern UniformExcitation 1 1 -accel 1
puts "analysis"
constraints Transformation
numberer Plain
system UmfPack
test EnergyIncr 1.0e-4 200
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
# 共50.01s
analyze 5001 0.01

