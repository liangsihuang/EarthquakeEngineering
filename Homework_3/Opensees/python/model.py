from opensees import *
wipe()
model('basic','-ndm',2)

H = 3600
L = 6000

node(1, 0, 0)
node(2, 0, H)
node(3, L, H)
node(4, L, 0)

mass(1, [0.109, 0.109, 0])
mass(2, [6.017, 6.017, 0])
mass(3, [6.017, 6.017, 0])
mass(4, [0.109, 0.109, 0])

fix(1, [1, 1, 1])
fix(4, [1, 1, 1])

fy = 345
E = 2e5
b= 0.01
uniaxialMaterial('Steel01', 1, [fy, E, b])

#梁截面
h = 300.0
b = 120.0
tf = 10.0
tw = 6.0
section('Fiber', 1)
patch('rect', 1, 5, 12, [-h/2, -b/2], [-h/2+tf, b/2])
patch('rect', 1, 28, 3, [-h/2+tf, -tw/2], [h/2-tf, tw/2])
patch('rect', 1, 5, 12, [h/2-tf, -b/2], [h/2, b/2])

#柱截面
h = 300.0
b = 300.0
tf = 10.0
tw = 6.0
section('Fiber', 2)
patch('rect', 1, 5, 30, [-h/2, -b/2], [-h/2+tf, b/2])
patch('rect', 1, 28, 3, [-h/2+tf, -tw/2], [h/2-tf, tw/2])
patch('rect', 1, 5, 30, [h/2-tf, -b/2], [h/2, b/2])

geomTransf('Linear', 1, [])

#梁单元
#beamIntegration('Lobatto', tag, secTag, N)
#element('forceBeamColumn', eleTag, iNode, jNode, transfTag, integrationTag...)
beamIntegration('Lobatto', 1, 1, 5)
element('forceBeamColumn', 1, 2, 3, 1, 1)
#柱单元
beamIntegration('Lobatto', 2, 2, 5)
element('forceBeamColumn', 2, 1, 2, 1, 2)
element('forceBeamColumn', 3, 3, 4, 1, 2)

