from fractions import Fraction as F

# s6 products (exact)
wp_lo = F(689719085816627, 500000000000000); wp_hi = F(689719085816629, 500000000000000)
wr_lo = F(269931005964161, 500000000000000); wr_hi = F(269931005964169, 500000000000000)

# b2 = 1 - (wB*pB - wB*rB)/2 ; b2_lo uses wp_hi,wr_lo ; b2_hi uses wp_lo,wr_hi
b2_lo = 1 - (wp_hi - wr_lo)/2
b2_hi = 1 - (wp_lo - wr_hi)/2
print("b2_lo =", b2_lo, "=", float(b2_lo))
print("b2_hi =", b2_hi, "=", float(b2_hi))
# express as /1e15
print("b2_lo as /1e15:", b2_lo*10**15)   # should be integer 580211920147532
print("b2_hi as /1e15:", b2_hi*10**15)

# mass2 = b2^2
mass2_lo = b2_lo**2
mass2_hi = b2_hi**2
print("mass2_lo =", float(mass2_lo))
print("mass2_hi =", float(mass2_hi))
# clean floor/ceil at 1e15
import math
cl = mass2_lo * 10**15
ch = mass2_hi * 10**15
print("mass2_lo*1e15 =", float(cl), "-> clean lo floor:", math.floor(cl))
print("mass2_hi*1e15 =", float(ch), "-> clean hi ceil:", math.ceil(ch))
mlo = math.floor(cl); mhi = math.ceil(ch)
print("mass2 clean: [", mlo, "/1e15,", mhi, "/1e15]")
# verify b2_lo^2 >= mlo/1e15 and b2_hi^2 <= mhi/1e15
print("check lo: b2_lo^2 >= mlo/1e15 ?", mass2_lo >= F(mlo,10**15))
print("check hi: b2_hi^2 <= mhi/1e15 ?", mass2_hi <= F(mhi,10**15))

# 1/mass2 bracket rationals
inv_lo = F(10**15, mhi)  # = 1/(mhi/1e15) <= 1/mass2_hi <= 1/mass2
inv_hi = F(10**15, mlo)  # >= 1/mass2
print("1/mass2 lo = 1e15/", mhi, "=", float(inv_lo))
print("1/mass2 hi = 1e15/", mlo, "=", float(inv_hi))
print("check: inv_lo <= 1/mass2_hi ?", inv_lo <= 1/mass2_hi)
print("check: 1/mass2_lo <= inv_hi ?", 1/mass2_lo <= inv_hi)

print("="*50)
# mbRatio: q in [7071067811865/1e13, 7071067811866/1e13]
q_lo = F(7071067811865, 10**13); q_hi = F(7071067811866, 10**13)
print("q_lo^2 =", float(q_lo**2), " < 1/2 ?", q_lo**2 < F(1,2))
print("q_hi^2 =", float(q_hi**2), " > 1/2 ?", q_hi**2 > F(1,2))
# mbRatio = (1-q)^2/(3(1+q)) decreasing -> mb_lo uses q_hi, mb_hi uses q_lo
mb_lo = (1-q_hi)**2/(3*(1+q_hi))
mb_hi = (1-q_lo)**2/(3*(1+q_lo))
print("mb_lo =", float(mb_lo), " mb_hi =", float(mb_hi))
clo = mb_lo*10**15; chi = mb_hi*10**15
mblo = math.floor(clo); mbhi = math.ceil(chi)
print("mbRatio clean: [", mblo, "/1e15,", mbhi, "/1e15]")
print("check lo:", mb_lo >= F(mblo,10**15), " check hi:", mb_hi <= F(mbhi,10**15))
inv_mb_lo = F(10**15, mbhi); inv_mb_hi = F(10**15, mblo)
print("1/mbRatio lo = 1e15/", mbhi, " hi = 1e15/", mblo)
print("check: inv_mb_lo <= 1/mb_hi ?", inv_mb_lo <= 1/mb_hi)
print("check: 1/mb_lo <= inv_mb_hi ?", 1/mb_lo <= inv_mb_hi)
