import mpmath as mp
mp.mp.dps = 50

# banked undressedEdgeRatio rho = b2/b0 in [24383/1e5, 24385/1e5], true 0.24384408
rho_lo = mp.mpf(24383)/100000
rho_hi = mp.mpf(24385)/100000
rho_true = mp.mpf('0.243844083475')
s = mp.mpf(2)/3

def cabMix2(rho):
    return (rho**2/9)/((1+rho**2)*(1+(mp.mpf(4)/9)*rho**2))

print("cabMix2 true =", mp.nstr(cabMix2(rho_true),14))
print("cabMix2(rho_lo) =", mp.nstr(cabMix2(rho_lo),14))
print("cabMix2(rho_hi) =", mp.nstr(cabMix2(rho_hi),14))

# provable bracket construction (monotone increasing in rho on this range):
# lower: numerator at rho_lo, denominator at rho_hi
num_lo = rho_lo**2/9
den_hi = (1+rho_hi**2)*(1+(mp.mpf(4)/9)*rho_hi**2)
cm_lo = num_lo/den_hi
num_hi = rho_hi**2/9
den_lo = (1+rho_lo**2)*(1+(mp.mpf(4)/9)*rho_lo**2)
cm_hi = num_hi/den_lo
print("\nprovable-safe cabMix2 in [%s, %s]"%(mp.nstr(cm_lo,14),mp.nstr(cm_hi,14)))

# intermediate brackets I'll bank:
# rho^2 in [rho_lo^2, rho_hi^2]
r2lo=rho_lo**2; r2hi=rho_hi**2
print("\nrho^2 in [%s, %s]  true %s"%(mp.nstr(r2lo,12),mp.nstr(r2hi,12),mp.nstr(rho_true**2,12)))
# numerator N = rho^2/9 in [r2lo/9, r2hi/9]
print("N=rho^2/9 in [%s, %s]"%(mp.nstr(r2lo/9,12),mp.nstr(r2hi/9,12)))
# denominator D = (1+rho^2)(1+(4/9)rho^2); increasing in rho^2
Dlo=(1+r2lo)*(1+(mp.mpf(4)/9)*r2lo); Dhi=(1+r2hi)*(1+(mp.mpf(4)/9)*r2hi)
print("D in [%s, %s]  true %s"%(mp.nstr(Dlo,12),mp.nstr(Dhi,12),mp.nstr((1+rho_true**2)*(1+(mp.mpf(4)/9)*rho_true**2),12)))

# final rational bracket to declare (must enclose [cm_lo, cm_hi]):
lo_decl = mp.mpf(60748)/10000000   # 0.0060748
hi_decl = mp.mpf(60759)/10000000   # 0.0060759
print("\nDeclare cabMix2 in [60748/1e7, 60759/1e7] = [%s, %s]"%(mp.nstr(lo_decl,10),mp.nstr(hi_decl,10)))
print("  cm_lo=%s >= 60748/1e7=%s ? %s"%(mp.nstr(cm_lo,12),mp.nstr(lo_decl,10),cm_lo>=lo_decl))
print("  cm_hi=%s <= 60759/1e7=%s ? %s"%(mp.nstr(cm_hi,12),mp.nstr(hi_decl,10),cm_hi<=hi_decl))

# also the |Vmix| (sin) via cutSqrt if wanted:
print("\n|Vmix| = sqrt(cabMix2) =", mp.nstr(mp.sqrt(cabMix2(rho_true)),10))
print("measured sin theta_C ~ 0.2252 (removable prose); banked undressedEdgeRatio ~0.2438")

# aligned complement for the unitarity tooth:
def cabAln2(rho):
    return ((1+s*rho**2)/((1+rho**2)*(1+s**2*rho**2)))  # wait recompute
# aligned = a0^2 + s a1^2 = a0^2(1+ s rho^2); |Valn|^2 = aligned^2/(nu*nd)
# nu = a0^2(1+rho^2), nd=a0^2(1+s^2 rho^2); aligned^2 = a0^4 (1+ s rho^2)^2
# |Valn|^2 = (1+s rho^2)^2 / ((1+rho^2)(1+s^2 rho^2))
def cabAln2b(rho):
    return (1+s*rho**2)**2/((1+rho**2)*(1+s**2*rho**2))
print("\n|Valn|^2 =", mp.nstr(cabAln2b(rho_true),12))
print("cabMix2+cabAln2 =", mp.nstr(cabMix2(rho_true)+cabAln2b(rho_true),18), " (should be EXACTLY 1 by Brahmagupta-Fibonacci)")
