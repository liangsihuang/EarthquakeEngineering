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
# mass 1 0.109 0.109 0.0
mass 1 0.0 0.0 0.0
# mass 2 5.905 5.905 0.0
# mass 3 5.905 5.905 0.0
mass 2 6.017 6.017 0.0
mass 3 6.017 6.017 0.0
mass 4 0.0 0.0 0.0
# mass 4 0.109 0.109 0.0
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
puts "recorder"
set numModes 2
# 最多只有两阶模态，没有梁轴向压缩的模态，对比SAP2000，自振周期偏小，说明结构偏刚
# 即使sap2000令剪切面积为0，退化为欧拉梁，还是比Opensees的梁柔
for {set k 1} {$k <= $numModes} {incr k} {
    recorder Node -file [format "modes/mode%i.out" $k] -nodeRange 1 4 -dof 1 2 3 "eigen $k"
}

set lambda [eigen  $numModes]
set omega {}
set f {}
set T {}
set pi 3.141593
foreach lam $lambda {
    lappend omega [expr sqrt($lam)]
    lappend f [expr sqrt($lam)/(2*$pi)]
    lappend T [expr (2*$pi)/sqrt($lam)]
}
set period "modes/Periods.txt"
set Periods [open $period "w"]
foreach t $T {
    puts $Periods "$t"
}
close $Periods
record

# 失败
# recorder display "Mode Shape 1" 10 10 10000 10000 -wipe
# prp [expr $l/2] [expr $h/2] 1;
# vup  0  1 0;
# vpn  0  0 1;
# viewWindow -3500 3500 -3500 3500
# display -1 5 20

# recorder display "Mode Shape 2" 10 10010 10000 10000 -wipe
# prp [expr $l/2] [expr $h/2] 1;
# vup  0  1 0;
# vpn  0  0 1;
# viewWindow -3500 3500 -3500 3500
# display -2 5 20

# source frame_mode.tcl