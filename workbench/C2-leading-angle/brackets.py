import mpmath as mp
mp.mp.dps = 50

p = mp.cos(mp.mpf(2)/9)
w = mp.sqrt(2)
r = mp.sqrt(3 - 3*p*p)
b0 = 1 + w*p          # shallow / leading amp  (banked bracket [237943/1e5, 237944/1e5])
b1 = 1 - w*(p+r)/2    # lightest
b2 = 1 - w*(p-r)/2    # deep amp (banked bracket [5802/1e4, 58022/1e5])
s  = mp.mpf(2)/3      # edgeSurvival

print("b0=%s b2=%s   b2/b0=%s (banked undressed edge ratio ~0.2438)"%(mp.nstr(b0,12),mp.nstr(b2,12),mp.nstr(b2/b0,12)))

# ===== C2 forced object: C1 survival-dressed misalignment through normalized overlap =====
# up frame u=(b0,b2); down frame d=(b0, s*b2). Cabibbo-scale edge = the banked deep/shallow (b2/b0) edge.
u0,u1 = b0, b2
d0,d1 = b0, s*b2
cross   = u1*d0 - u0*d1          # = b0*b2*(1-s)
aligned = u0*d0 + u1*d1          # = b0^2 + s*b2^2
nu = u0*u0 + u1*u1               # b0^2+b2^2
nd = d0*d0 + d1*d1               # b0^2+s^2 b2^2
Vmix2   = cross**2/(nu*nd)
Valn2   = aligned**2/(nu*nd)
print("\n=== C2 object at (b0,b2) survival-dressed ===")
print("cross   = b0*b2*(1-s) =", mp.nstr(cross,14))
print("aligned = b0^2+s*b2^2 =", mp.nstr(aligned,14))
print("nu = b0^2+b2^2        =", mp.nstr(nu,14))
print("nd = b0^2+s^2 b2^2    =", mp.nstr(nd,14))
print("|Vmix|^2 =", mp.nstr(Vmix2,14), "   |Vmix| =", mp.nstr(mp.sqrt(Vmix2),12))
print("|Valn|^2 =", mp.nstr(Valn2,14))
print("Vmix2+Valn2 =", mp.nstr(Vmix2+Valn2,20), " (Brahmagupta-Fibonacci -> exactly 1)")

# The mixing fraction is simplest written as cross^2/(nu*nd). Let me also give a clean reduced form.
# cross = b0*b2*(1-s), so cross^2 = b0^2 b2^2 (1-s)^2 = b0^2 b2^2 /9.
# So |Vmix|^2 = b0^2 b2^2 /9 / ((b0^2+b2^2)(b0^2+ (4/9) b2^2)).
print("\ncheck cross^2 = b0^2 b2^2/9:", mp.nstr(cross**2 - (b0*b2)**2/9, 6))

# Let rho = b2/b0. Then |Vmix|^2 = rho^2/9 / ((1+rho^2)(1+ (4/9)rho^2))
rho = b2/b0
alt = (rho**2/9)/((1+rho**2)*(1+(mp.mpf(4)/9)*rho**2))
print("alt via rho:", mp.nstr(alt,14), " matches:", mp.nstr(alt-Vmix2,6))

# ===== bracket endpoints (need to be provable via banked b0,b2 brackets) =====
# banked: b0 in [237943/1e5, 237944/1e5], b2 in [5802/1e4, 58022/1e5]
b0lo=mp.mpf(237943)/100000; b0hi=mp.mpf(237944)/100000
b2lo=mp.mpf(5802)/10000;    b2hi=mp.mpf(58022)/100000
print("\nbanked b0 in [%s,%s], b2 in [%s,%s]"%(b0lo,b0hi,b2lo,b2hi))
# cross^2 = b0^2 b2^2/9. bracket:
cross2_lo = (b0lo*b2lo)**2/9
cross2_hi = (b0hi*b2hi)**2/9
print("cross^2 in [%s, %s] (true %s)"%(mp.nstr(cross2_lo,10),mp.nstr(cross2_hi,10),mp.nstr(cross**2,10)))
# nu = b0^2+b2^2
nu_lo = b0lo**2+b2lo**2; nu_hi=b0hi**2+b2hi**2
# nd = b0^2+ (4/9) b2^2
nd_lo = b0lo**2+(mp.mpf(4)/9)*b2lo**2; nd_hi=b0hi**2+(mp.mpf(4)/9)*b2hi**2
print("nu in [%s,%s] nd in [%s,%s]"%(mp.nstr(nu_lo,10),mp.nstr(nu_hi,10),mp.nstr(nd_lo,10),mp.nstr(nd_hi,10)))
Vmix2_lo = cross2_lo/(nu_hi*nd_hi)
Vmix2_hi = cross2_hi/(nu_lo*nd_lo)
print("|Vmix|^2 in [%s, %s]"%(mp.nstr(Vmix2_lo,12),mp.nstr(Vmix2_hi,12)))
print("true |Vmix|^2 =", mp.nstr(Vmix2,12))
# propose rational brackets (loose, safely enclosing):
print("\nPropose |Vmix|^2 bracket [606/1e5, 608/1e5] = [0.00606,0.00608]; true=%s"%mp.nstr(Vmix2,8))
print("  Vmix2_lo=%s >= 606/1e5=%s ? %s"%(mp.nstr(Vmix2_lo,10), mp.nstr(mp.mpf(606)/100000,8), Vmix2_lo>=mp.mpf(606)/100000))
print("  Vmix2_hi=%s <= 608/1e5=%s ? %s"%(mp.nstr(Vmix2_hi,10), mp.nstr(mp.mpf(608)/100000,8), Vmix2_hi<=mp.mpf(608)/100000))
