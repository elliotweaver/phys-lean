from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 80
def fn(fr,n=25): return mp.nstr(mp.mpf(fr.numerator)/fr.denominator,n)

# ===== replicate the exact Lean bracket chain with chosen rational bounds =====
# 1. pB split@6 on 1e15 grid
pB_lo = F(975410085389447, 10**15)
pB_hi = F(975410085389448, 10**15)

# 2. wB sqrt2 on 1e15 grid
wB_lo = F(1414213562373095, 10**15)
wB_hi = F(1414213562373096, 10**15)

# 3. rB: rr=3-3pB^2. rr_lo=3-3pB_hi^2, rr_hi=3-3pB_lo^2. Choose rB on 1e15 grid.
rr_lo = 3 - 3*pB_hi*pB_hi
rr_hi = 3 - 3*pB_lo*pB_lo
# true r ~ 0.3817400895395348387522
rB_lo = F(381740089539534, 10**15)  # 0.381740089539534
rB_hi = F(381740089539536, 10**15)  # 0.381740089539536
print("rB_lo^2 <= rr_lo:", rB_lo*rB_lo <= rr_lo, " rr_hi <= rB_hi^2:", rr_hi <= rB_hi*rB_hi)

# 4. products wp=wB*pB, wr=wB*rB. Choose bounds ROUNDED (lower=floor, upper=ceil) on 1e15 grid.
def flo(x, G): return F(int(mp.floor(mp.mpf(x.numerator)/x.denominator*G)), G)
def fhi(x, G): return F(int(mp.ceil (mp.mpf(x.numerator)/x.denominator*G)), G)
G=10**15
wp_lo = flo(wB_lo*pB_lo, G)   # <= wB_lo*pB_lo <= wB*pB
wp_hi = fhi(wB_hi*pB_hi, G)
wr_lo = flo(wB_lo*rB_lo, G)
wr_hi = fhi(wB_hi*rB_hi, G)
print("wp_lo <= wB_lo*pB_lo:", wp_lo <= wB_lo*pB_lo, " wp_hi>=wB_hi*pB_hi:", wp_hi>=wB_hi*pB_hi)
print("wr_lo <= wB_lo*rB_lo:", wr_lo <= wB_lo*rB_lo, " wr_hi>=wB_hi*rB_hi:", wr_hi>=wB_hi*rB_hi)

# 5. amplitudes
b0_lo = 1 + wp_lo
b0_hi = 1 + wp_hi
# b1 = 1 - (wp+wr)/2 ; b1_lo uses wp_hi,wr_hi ; b1_hi uses wp_lo,wr_lo
b1_lo = 1 - (wp_hi + wr_hi)/2
b1_hi = 1 - (wp_lo + wr_lo)/2
print("b0 in [",fn(b0_lo),",",fn(b0_hi),"]")
print("b1 in [",fn(b1_lo),",",fn(b1_hi),"]  (b1_lo>0:", b1_lo>0,")")

# 6. masses (kept as squared products)
# mass0 in [b0_lo^2, b0_hi^2]; mass1 in [b1_lo^2, b1_hi^2]
mass0_lo = b0_lo*b0_lo
mass0_hi = b0_hi*b0_hi
mass1_lo = b1_lo*b1_lo
mass1_hi = b1_hi*b1_hi

# 7. m01 = mass0/mass1 : lo = mass0_lo/mass1_hi, hi = mass0_hi/mass1_lo
m01_lo_real = mass0_lo/mass1_hi
m01_hi_real = mass0_hi/mass1_lo
print("m01 real bracket: [",fn(m01_lo_real),",",fn(m01_hi_real),"]")
# target m01 rationals
m01_lo = F(3477472837103, 10**9)
m01_hi = F(3477472837106, 10**9)
print("target m01 rationals: [",fn(m01_lo),",",fn(m01_hi),"]")
print("m01_lo <= m01_lo_real (need mass0_lo/mass1_hi >= m01_lo):", m01_lo <= m01_lo_real)
print("m01_hi >= m01_hi_real (need mass0_hi/mass1_lo <= m01_hi):", m01_hi >= m01_hi_real)
print("  -> for lower lemma: m01_lo * mass1_hi <= mass0_lo :", m01_lo*mass1_hi <= mass0_lo)
print("  -> for upper lemma: mass0_hi <= m01_hi * mass1_lo :", mass0_hi <= m01_hi*mass1_lo)
print()
print("=== chosen literal bounds ===")
for nm,v in [("pB_lo",pB_lo),("pB_hi",pB_hi),("wB_lo",wB_lo),("wB_hi",wB_hi),
             ("rB_lo",rB_lo),("rB_hi",rB_hi),("wp_lo",wp_lo),("wp_hi",wp_hi),
             ("wr_lo",wr_lo),("wr_hi",wr_hi),("b0_lo",b0_lo),("b0_hi",b0_hi),
             ("b1_lo",b1_lo),("b1_hi",b1_hi),("m01_lo",m01_lo),("m01_hi",m01_hi)]:
    print(f"{nm} = {v.numerator}/{v.denominator}")
