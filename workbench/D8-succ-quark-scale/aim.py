import math
q=1/math.sqrt(2)
val=(1-q)**2/(3*(1+q))
print('m_b/m_t Born ratio =', val)
print('sqrt (amplitude ratio) =', math.sqrt(val))
print('PDG m_b/m_t ~ 4.18/173 =', 4.18/173.0)
P=math.pi/8
amp=(math.tan(P)**2)*math.cos(P)*math.sqrt(2/3)
print('key amplitude (tan^2P cosP sqrt(2/3)) =', amp, ' squared=', amp**2)
# my foldPhaseBorn = sin^4 P / cos^2 P
fpb=(math.sin(P)**4)/(math.cos(P)**2)
print('foldPhaseBorn =', fpb, ' * 2/3 =', fpb*2/3)
