"""Emit EXACT Lean rational constants for the ext7 (1e12-grid) leastCosZero instrument."""
from fractions import Fraction as F

floor12 = 1570796326794
ceil12 = 1570796326795

# ---- LOWER positivity: cutCos_gt_pi8_12 ----
print("=== LOWER (positivity) ===")
yLmax = F(floor12, 4*10**12)          # = 785398163397/2e12
print("yLmax bound in lemma: y < 785398163397/2000000000000  (=", yLmax, ")")
Bnum = (785398163397)**2               # square numerator, den 4e24
print("Bsq = %d / 4000000000000000000000000" % Bnum)
C = F(9238795325113, 10**13)           # threshold C_12
print("C = 9238795325113/10000000000000")
# u_lo = 2C^2 - 1 exact reduced
uC = 2*C*C - 1
print("uC = 2C^2-1 = %d / %d" % (uC.numerator, uC.denominator))
# final closure 2uC^2-1
finalC = 2*uC*uC - 1
print("closure 2uC^2-1 = %d/%d  >0? %s" % (finalC.numerator, finalC.denominator, finalC>0))

# ---- UPPER via DDA negativity ----
print("\n=== UPPER (DDA negativity) ===")
yU = F(ceil12, 4*10**12)               # = 314159265359/8e11
print("yU = 314159265359/800000000000  (=", yU, ")")
# square bound for yU
yUsqN = (314159265359)**2
print("yU^2 < %d / 640000000000000000000000" % yUsqN)   # (8e11)^2 = 64e22 = 6.4e23
R = F(923879532511277, 10**15)
print("R = 923879532511277/1000000000000000")
uR = 2*R*R - 1
print("uR = 2R^2-1 = %d/%d" % (uR.numerator, uR.denominator))
closureR = 2*uR*uR - 1
print("closure(R) 2uR^2-1 = %d/%d  <0? %s" % (closureR.numerator, closureR.denominator, closureR<0))
Llo = F(9,10)
print("v lower Llo = 9/10 ; u=2v^2-1 >= 2*(81/100)-1 = 62/100 > 0")

# ---- cutPi / 1/cutPi ext7 ----
print("\n=== cutPi / 1/cutPi ext7 ===")
print("leastCosZero in [%d/1000000000000, %d/1000000000000]" % (floor12, ceil12))
cutPi_lo = F(2*floor12, 10**12); cutPi_hi = F(2*ceil12, 10**12)
print("cutPi_lo = %d/%d" % (cutPi_lo.numerator, cutPi_lo.denominator))
print("cutPi_hi = %d/%d" % (cutPi_hi.numerator, cutPi_hi.denominator))
inv_lo = 1/cutPi_hi; inv_hi = 1/cutPi_lo
print("1/cutPi in [%d/%d, %d/%d]" % (inv_lo.numerator,inv_lo.denominator,inv_hi.numerator,inv_hi.denominator))
# ext6 for nesting
e6lo=F(1250000000,3926990817); e6hi=F(50000000000,157079632679)
print("ext6: [%d/%d, %d/%d]" % (e6lo.numerator,e6lo.denominator,e6hi.numerator,e6hi.denominator))
print("nested lo:", inv_lo>=e6lo, " hi:", inv_hi<=e6hi)
