import mpmath as mp
mp.mp.dps = 80

p = mp.cos(mp.mpf(2)/9)
w = mp.sqrt(2)
r = mp.sqrt(3 - 3*p*p)
b0 = 1 + w*p
b1 = 1 - w*(p+r)/2
mass0 = b0*b0
mass1 = b1*b1
m01 = mass0/mass1
print("p    =", mp.nstr(p,30))
print("w    =", mp.nstr(w,30))
print("r    =", mp.nstr(r,30))
print("b0   =", mp.nstr(b0,30))
print("b1   =", mp.nstr(b1,30))
print("mass0=", mp.nstr(mass0,30))
print("mass1=", mp.nstr(mass1,30))
print("m01  =", mp.nstr(m01,30))
print("cutLog(m01) =", mp.nstr(mp.log(m01),30))
print()
# split@5 banked m01 bracket [3477.472814, 3477.472936], cutLog [8.15406110, 8.15406115]
print("split@5 m01 lo 3477.472814 -> log =", mp.nstr(mp.log(mp.mpf('3477.472814')),20))
print("split@5 m01 hi 3477.472936 -> log =", mp.nstr(mp.log(mp.mpf('3477.472936')),20))
print("d(log)/d(m01) = 1/m01 =", mp.nstr(1/m01, 10))
