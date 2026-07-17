from fractions import Fraction as F
import mpmath as mp
mp.mp.dps = 50

# endpoint = 190/3 + (d/3)*cutLog*(1/cutPi), d=16/3 -> d/3=16/9
d3 = F(16,9)
la = F(815406110,10**8); lb = F(815406115,10**8)      # cutLog (reused)
pa = F(500000000,1570796327); pb = F(250000000,785398163)  # 1/cutPi 1e9

def endpoint(cl, inv):
    return F(190,3) + d3*cl*inv

lo = endpoint(la, pa)   # lower: la, pa
hi = endpoint(lb, pb)   # upper: lb, pb
print("assembled LOWER =", lo, "=", mp.nstr(mp.mpf(lo.numerator)/lo.denominator,25))
print("assembled UPPER =", hi, "=", mp.nstr(mp.mpf(hi.numerator)/hi.denominator,25))
w = hi-lo
print("width ~", mp.nstr(mp.mpf(w.numerator)/w.denominator,6))

# parent (D5-next-8) bracket
plo = F(48029320130,706858353); phi = F(12007329895,176714586)
pw = phi-plo
print()
print("parent LOWER =", plo, "=", mp.nstr(mp.mpf(plo.numerator)/plo.denominator,25))
print("parent UPPER =", phi, "=", mp.nstr(mp.mpf(phi.numerator)/phi.denominator,25))
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
print("dressed LOWER =", dlo, "=", mp.nstr(mp.mpf(dlo.numerator)/dlo.denominator,25))
print("dressed UPPER =", dhi, "=", mp.nstr(mp.mpf(dhi.numerator)/dhi.denominator,25))
# parent dressed
pdlo=F(19066651594,235619451); pdhi=F(9533325691,117809724)
print("parent dressed nested lower ok?", dlo>=pdlo, " upper ok?", dhi<=pdhi)
