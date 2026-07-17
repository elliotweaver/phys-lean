from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50

# endpoint = 190/3 + (d/3)*cutLog*(1/cutPi), d=16/3 -> d/3=16/9
d3 = F(16,9)
la = F(815406110,10**8); lb = F(815406115,10**8)      # cutLog (reused, split@5)
# 1/cutPi 1e10: leastCosZero in [15707963267/1e10, 15707963268/1e10]
# cutPi in [2*15707963267/1e10, 2*15707963268/1e10] = [15707963267/5e9, 3926990817/1.25e9]
# 1/cutPi in [1250000000/3926990817, 5000000000/15707963267]
pa = F(1250000000,3926990817); pb = F(5000000000,15707963267)  # 1/cutPi 1e10

def endpoint(cl, inv):
    return F(190,3) + d3*cl*inv

lo = endpoint(la, pa)   # lower: la, pa
hi = endpoint(lb, pb)   # upper: lb, pb
print("assembled LOWER =", lo, "=", mp.nstr(mp.mpf(lo.numerator)/lo.denominator,28))
print("assembled UPPER =", hi, "=", mp.nstr(mp.mpf(hi.numerator)/hi.denominator,28))
w = hi-lo
print("width ~", mp.nstr(mp.mpf(w.numerator)/w.denominator,6))

# parent (D5-next-9) bracket
plo = F(960586395190,14137166943); phi = F(480293197510,7068583467)
pw = phi-plo
print()
print("parent(D5-next-9) LOWER =", plo, "=", mp.nstr(mp.mpf(plo.numerator)/plo.denominator,28))
print("parent(D5-next-9) UPPER =", phi, "=", mp.nstr(mp.mpf(phi.numerator)/phi.denominator,28))
print("parent width ~", mp.nstr(mp.mpf(pw.numerator)/pw.denominator,6))
print()
print("NESTED lower: new_lo >= parent_lo ?", lo >= plo, " (new_lo - parent_lo =", mp.nstr(mp.mpf((lo-plo).numerator)/(lo-plo).denominator,6),")")
print("NESTED upper: new_hi <= parent_hi ?", hi <= phi, " (parent_hi - new_hi =", mp.nstr(mp.mpf((phi-hi).numerator)/(phi-hi).denominator,6),")")
print("STRICT: new_lo < new_hi ?", lo < hi)
print("width narrower ?", w < pw, " factor ~", mp.nstr(mp.mpf(pw.numerator)/pw.denominator / (mp.mpf(w.numerator)/w.denominator),4))
print("above 190/3 ?", lo > F(190,3))

# DRESSED: 74 + (d/2)*cutLog*(1/cutPi), d/2 = 8/3
print()
print("### DRESSED (w=1/3): 74 + (8/3)*cutLog*(1/cutPi) ###")
d2 = F(8,3)
dlo = F(74) + d2*la*pa
dhi = F(74) + d2*lb*pb
print("dressed LOWER =", dlo, "=", mp.nstr(mp.mpf(dlo.numerator)/dlo.denominator,28))
print("dressed UPPER =", dhi, "=", mp.nstr(mp.mpf(dhi.numerator)/dhi.denominator,28))
# parent dressed
pdlo=F(381333028994,4712388981); pdhi=F(190666514486,2356194489)
print("parent dressed nested lower ok?", dlo>=pdlo, " upper ok?", dhi<=pdhi)
print("dressed strict?", dlo<dhi)

# --- the cutPi bracket literals for Lean ---
print()
print("### cutPi bracket literals ###")
# cutPi_lo = 15707963267/5000000000 ; cutPi_hi = 3926990817/1250000000
print("cutPi in [15707963267/5000000000, 3926990817/1250000000]")
print("  check 15707963267/5e9 = 2*15707963267/1e10 ?", F(15707963267,5000000000)==F(2*15707963267,10**10))
print("  check 3926990817/1.25e9 = 2*15707963268/1e10 ?", F(3926990817,1250000000)==F(2*15707963268,10**10))
print("1/cutPi in [1250000000/3926990817, 5000000000/15707963267]")
