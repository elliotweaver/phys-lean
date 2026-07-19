from fractions import Fraction as F
from math import factorial
def pE(y,N): return sum(y**i/F(factorial(i)) for i in range(N))
def rem(y,N): return (y**N/F(factorial(N)))/(1-y/(N+1))

m2L = F(336645872281271, 10**15); m2H = F(336645872281307, 10**15)
inv2_lo=1/m2H; inv2_hi=1/m2L
# widen L_b2 target: cutLog(1/mass2) in [10887237252235/1e13, 10887237252238/1e13]
u_lo=F(10887237252235,10**13); u_hi=F(10887237252238,10**13)
for N in range(14,26):
    if pE(u_lo,N)+rem(u_lo,N) <= inv2_lo: print("L_b2 lo cert N=%d ok"%N); break
for N in range(14,26):
    if inv2_hi <= pE(u_hi,N): print("L_b2 hi cert N=%d ok"%N); break
# => cutLog mass2 in [-10887237252238/1e13, -10887237252235/1e13], width 3e-13
Lb2_lo=F(-10887237252238,10**13); Lb2_hi=F(-10887237252235,10**13)
print("L_b2 in [%s, %s] width %.1e"%(Lb2_lo,Lb2_hi,float(Lb2_hi-Lb2_lo)))

# Now re-verify the endpoint bracket with this slightly wider L_b2
klo=F(1250000000,3926990817)/3; khi=F(50000000000,157079632679)/3
Lm01_lo=F(815406111272,10**11); Lm01_hi=F(815406111273,10**11)
Lb0_lo=F(17337287949546,10**13); Lb0_hi=F(17337287949547,10**13)
Lmb_lo=F(-40893066400068,10**13); Lmb_hi=F(-40893066400067,10**13)
inner_lo=2*Lm01_lo+F(7,3)*Lmb_lo+F(11,3)*Lb0_lo-F(5,3)*Lb2_hi
inner_hi=2*Lm01_hi+F(7,3)*Lmb_hi+F(11,3)*Lb0_hi-F(5,3)*Lb2_lo
print("BARE inner [%.14f, %.14f] w=%.2e"%(float(inner_lo),float(inner_hi),float(inner_hi-inner_lo)))
inner_L=F(149379518556,10**10); inner_H=F(149379518557,10**10)
print("  inner_L<=lo:",inner_L<=inner_lo," hi<=inner_H:",inner_hi<=inner_H)
base=F(2425,18); E_LO=F(1363071881405,10**10); E_HI=F(1363071881406,10**10)
print("  BARE h2:",klo*inner_L>=E_LO-base, khi*inner_H<=E_HI-base)
print("  endpoint [%.13f,%.13f]"%(float(base+klo*inner_L),float(base+khi*inner_H)))
# DRESSED
innerd_lo=3*Lm01_lo+F(7,2)*Lmb_lo+F(11,2)*Lb0_lo-F(5,2)*Lb2_hi
innerd_hi=3*Lm01_hi+F(7,2)*Lmb_hi+F(11,2)*Lb0_hi-F(5,2)*Lb2_lo
print("DRESSED inner [%.14f,%.14f] w=%.2e"%(float(innerd_lo),float(innerd_hi),float(innerd_hi-innerd_lo)))
innerd_L=F(224069277834,10**10); innerd_H=F(224069277835,10**10)
print("  innerd_L<=lo:",innerd_L<=innerd_lo," hi<=innerd_H:",innerd_hi<=innerd_H)
ED_LO=F(1370996710997,10**10); ED_HI=F(1370996710998,10**10)
print("  DRESSED h2:",klo*innerd_L>=ED_LO-base, khi*innerd_H<=ED_HI-base)
print("  dressed [%.13f,%.13f]"%(float(base+klo*innerd_L),float(base+khi*innerd_H)))
