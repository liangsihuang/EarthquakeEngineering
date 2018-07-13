wipe
source frame_nonlinear.tcl
source ReadSMDFile.tcl
ReadSMDFile RSN6_IMPVALL.I_I-ELC180.AT2 ElCentro4OO.acc dt
# dt 是引用传递，所以运行完函数后有值？ 但是报错了
# 报错：错误来自dt
# set accelSeries "Series -dt $dt -filePath ElCentro4OO.acc -factor 9.8"
# pattern UniformExcitation 2 1 -accel $accelSeries
#  手动输入dt
timeSeries Path 1 -dt 0.01 -filePath ElCentro4OO.acc -factor 9.8
pattern UniformExcitation 2 1 -accel 1

set numModes 2
# 最多只有两阶模态，没有梁轴向压缩的模态，对比SAP2000，自振周期偏小，说明结构偏刚
# 即使sap2000令剪切面积为0，退化为欧拉梁，还是比Opensees的梁柔
rayleigh 0 0 0 [expr 2*0.02*/pow([eigen 1], 0.5)]

recorder Node -file Node2disp.out -time -node 2 -dof 1 disp

constraints Plain
numberer RCM
system UmfPack
test NormDispIncr 1.0e-8 10
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
# 时间间隔dt=0.02s，分析30s
analyze [expr 10/0.02] 0.02

