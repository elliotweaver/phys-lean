from fractions import Fraction as F
import mpmath as mp, math
mp.mp.dps = 90

def fnum(fr, n=28):
    return mp.nstr(mp.mpf(fr.numerator)/fr.denominator, n)

# pB split@6 on 1e15 grid
pB_lo = F(975410085389447, 10**15)
pB_hi = F(975410085389448, 10**15)

# wB sqrt2 on 1e15 grid
wB_lo = F(1414213562373095, 10**15)
wB_hi = F(1414213562373096, 10**15)
assert wB_lo*wB_lo <= 2 <= wB_hi*wB_hi

# rr = 3 - 3 pB^2
rr_lo = 3 - 3*pB_hi*pB_hi
rr_hi = 3 - 3*pB_lo*pB_lo
# choose rB bounds on 1e14 grid with margin: rB_lo^2<=rr_lo, rB_hi^2>=rr_hi
# true r ~ 0.38174008953953483875
rB_lo = F(38174008953953, 10**14)   # 0.38174008953953
rB_hi = F(38174008953954, 10**14)   # 0.38174008953954
print("rB_lo^2 <= rr_lo:", rB_lo*rB_lo <= rr_lo, " rr_hi <= rB_hi^2:", rr_hi <= rB_hi*rB_hi)
print("rB_lo=",fnum(rB_lo)," rB_hi=",fnum(rB_hi))
print()

# products
wp_lo = wB_lo*pB_lo
wp_hi = wB_hi*pB_hi
wr_lo = wB_lo*rB_lo
wr_hi = wB_hi*rB_hi

# b0 = 1 + w*p  ; b1 = 1 - (w*p + w*r)/2
b0_lo = 1 + wp_lo
b0_hi = 1 + wp_hi
b1_lo = 1 - (wp_hi + wr_hi)/2
b1_hi = 1 - (wp_lo + wr_lo)/2
print("b0 in [", fnum(b0_lo), ",", fnum(b0_hi), "]  width", float(b0_hi-b0_lo))
print("b1 in [", fnum(b1_lo), ",", fnum(b1_hi), "]  width", float(b1_hi-b1_lo))
print("b1 true =", mp.nstr(1 - mp.sqrt(2)*(mp.cos(mp.mpf(2)/9)+mp.sqrt(3-3*mp.cos(mp.mpf(2)/9)**2))/2, 25))
print()

# mass0 = b0^2 ; mass1 = b1^2  (b0,b1>0)
mass0_lo = b0_lo*b0_lo
mass0_hi = b0_hi*b0_hi
mass1_lo = b1_lo*b1_lo
mass1_hi = b1_hi*b1_hi

# m01 = mass0/mass1  -> lo = mass0_lo/mass1_hi ; hi = mass0_hi/mass1_lo
m01_lo = mass0_lo/mass1_hi
m01_hi = mass0_hi/mass1_lo
print("m01 in [", fnum(m01_lo), ",", fnum(m01_hi), "]")
print("m01 width =", float(m01_hi - m01_lo))
print("m01 true  =", mp.nstr(mp.mpf('3477.47283710459853231300122552'),20))
print()
# choose clean rational m01 bounds (decimal) enclosing [m01_lo, m01_hi]
# m01_lo ~ ?, m01_hi ~ ?
print("m01_lo float:", float(m01_lo))
print("m01_hi float:", float(m01_hi))
