from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 80
def fn(fr,n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)
def flo(x, G): return F(int(mp.floor(mp.mpf(x.numerator)/x.denominator*G)), G)
def fhi(x, G): return F(int(mp.ceil (mp.mpf(x.numerator)/x.denominator*G)), G)

pB_lo = F(975410085389447, 10**15); pB_hi = F(975410085389448, 10**15)
wB_lo = F(1414213562373095, 10**15); wB_hi = F(1414213562373096, 10**15)
rr_lo = 3 - 3*pB_hi*pB_hi
rr_hi = 3 - 3*pB_lo*pB_lo
# rB on 1e14 grid: floor of sqrt(rr_lo) for lo, ceil of sqrt(rr_hi) for hi
r_lo_true = mp.sqrt(mp.mpf(rr_lo.numerator)/rr_lo.denominator)
r_hi_true = mp.sqrt(mp.mpf(rr_hi.numerator)/rr_hi.denominator)
rB_lo = F(int(mp.floor(r_lo_true*10**14)), 10**14)
rB_hi = F(int(mp.ceil (r_hi_true*10**14)), 10**14)
print("rB_lo=",rB_lo," =",fn(rB_lo), " rB_hi=",rB_hi," =",fn(rB_hi))
print("rB_lo^2 <= rr_lo:", rB_lo*rB_lo <= rr_lo, " rr_hi <= rB_hi^2:", rr_hi <= rB_hi*rB_hi)

G=10**15
wp_lo = flo(wB_lo*pB_lo, G); wp_hi = fhi(wB_hi*pB_hi, G)
wr_lo = flo(wB_lo*rB_lo, G); wr_hi = fhi(wB_hi*rB_hi, G)
b0_lo = 1 + wp_lo; b0_hi = 1 + wp_hi
b1_lo = 1 - (wp_hi + wr_hi)/2; b1_hi = 1 - (wp_lo + wr_lo)/2
mass0_lo = b0_lo*b0_lo; mass0_hi = b0_hi*b0_hi
mass1_lo = b1_lo*b1_lo; mass1_hi = b1_hi*b1_hi
m01_lo_real = mass0_lo/mass1_hi; m01_hi_real = mass0_hi/mass1_lo
print("m01 real bracket: [",fn(m01_lo_real),",",fn(m01_hi_real),"]  width", float(m01_hi_real-m01_lo_real))
m01_lo = F(3477472837103, 10**9); m01_hi = F(3477472837106, 10**9)
print("lower lemma m01_lo*mass1_hi <= mass0_lo:", m01_lo*mass1_hi <= mass0_lo)
print("upper lemma mass0_hi <= m01_hi*mass1_lo:", mass0_hi <= m01_hi*mass1_lo)
print()
# also print the exact intermediate values used in Lean statements
print("=== literals ===")
for nm,v in [("pB_lo",pB_lo),("pB_hi",pB_hi),("wB_lo",wB_lo),("wB_hi",wB_hi),
             ("rB_lo",rB_lo),("rB_hi",rB_hi),("wp_lo",wp_lo),("wp_hi",wp_hi),
             ("wr_lo",wr_lo),("wr_hi",wr_hi),("b0_lo",b0_lo),("b0_hi",b0_hi),
             ("b1_lo",b1_lo),("b1_hi",b1_hi)]:
    print(f"{nm} = {v.numerator}/{v.denominator}   (~{fn(v,20)})")

# verify the rr conditions for the tight square bound used in nlinarith
# for rB_lo: need pB_hi*pB_hi bound. hp2hi: pB*pB <= pB_hi*pB_hi
# rB*rB = 3-3pB*pB >= 3-3pB_hi*pB_hi = rr_lo >= rB_lo*rB_lo. good.
print()
print("rr_lo =", rr_lo, " (=3-3*pB_hi^2)")
print("rr_hi =", rr_hi, " (=3-3*pB_lo^2)")
