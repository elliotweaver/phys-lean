from fractions import Fraction as F

b0_lo, b0_hi = F(237943, 100000), F(237944, 100000)
b1_lo, b1_hi = F(4034, 100000), F(40365, 1000000)
b2_lo, b2_hi = F(5802, 10000), F(58022, 100000)

# squared brackets (mass*)
m0_lo, m0_hi = b0_lo**2, b0_hi**2
m1_lo, m1_hi = b1_lo**2, b1_hi**2
m2_lo, m2_hi = b2_lo**2, b2_hi**2

print("mass0 in [%.10f, %.10f]" % (float(m0_lo), float(m0_hi)))
print("mass1 in [%.10f, %.10f]" % (float(m1_lo), float(m1_hi)))
print("mass2 in [%.10f, %.10f]" % (float(m2_lo), float(m2_hi)))
print()

def bracket_below(x, denom):
    # largest k/denom <= x
    import math
    return int(math.floor(x * denom))

def bracket_above(x, denom):
    import math
    return int(math.ceil(x * denom))

# Nu23 = b2^2 + b1^2 ; Nd23 = b2^2 + (4/9) b1^2
Nu23_lo = m2_lo + m1_lo; Nu23_hi = m2_hi + m1_hi
Nd23_lo = m2_lo + F(4,9)*m1_lo; Nd23_hi = m2_hi + F(4,9)*m1_hi
Nu13_lo = m0_lo + m1_lo; Nu13_hi = m0_hi + m1_hi
Nd13_lo = m0_lo + F(4,9)*m1_lo; Nd13_hi = m0_hi + F(4,9)*m1_hi

for nm, lo, hi, d in [("Nu23", Nu23_lo, Nu23_hi, 1000000),
                       ("Nd23", Nd23_lo, Nd23_hi, 1000000),
                       ("Nu13", Nu13_lo, Nu13_hi, 1000000),
                       ("Nd13", Nd13_lo, Nd13_hi, 1000000)]:
    kl = bracket_below(lo, d); kh = bracket_above(hi, d)
    print("%s true [%.10f,%.10f] -> [%d/%d, %d/%d] = [%.10f,%.10f] ok=%s" % (
        nm, float(lo), float(hi), kl, d, kh, d, kl/d, kh/d,
        F(kl,d) <= lo and hi <= F(kh,d)))
print()

# cross brackets: eCross A B = A*B/3
def cross_bracket(Alo, Ahi, Blo, Bhi, d):
    lo = Alo*Blo/3; hi = Ahi*Bhi/3
    kl = bracket_below(lo, d); kh = bracket_above(hi, d)
    return kl, kh, lo, hi
for nm, (Alo,Ahi,Blo,Bhi), d in [("cross23(b2,b1)", (b2_lo,b2_hi,b1_lo,b1_hi), 10000000),
                                    ("cross13(b0,b1)", (b0_lo,b0_hi,b1_lo,b1_hi), 10000000)]:
    kl,kh,lo,hi = cross_bracket(Alo,Ahi,Blo,Bhi,d)
    print("%s true [%.9f,%.9f] -> [%d/%d, %d/%d] ok=%s" % (
        nm, float(lo), float(hi), kl, d, kh, d, F(kl,d)<=lo and hi<=F(kh,d)))
print()

# product brackets b1*b2 and b0*b1
for nm,(Xlo,Xhi,Ylo,Yhi),d in [("b1b2",(b1_lo,b1_hi,b2_lo,b2_hi),1000000),
                                 ("b0b1",(b0_lo,b0_hi,b1_lo,b1_hi),1000000)]:
    lo=Xlo*Ylo; hi=Xhi*Yhi
    kl=bracket_below(lo,d); kh=bracket_above(hi,d)
    print("%s true [%.9f,%.9f] -> [%d/%d,%d/%d] ok=%s"%(nm,float(lo),float(hi),kl,d,kh,d,F(kl,d)<=lo and hi<=F(kh,d)))
print()

# final mix brackets: mix = cross^2/(Nu*Nd)
def mix_bracket(cross_lo, cross_hi, Nu_lo, Nu_hi, Nd_lo, Nd_hi, d):
    lo = cross_lo**2/(Nu_hi*Nd_hi)
    hi = cross_hi**2/(Nu_lo*Nd_lo)
    kl=bracket_below(lo,d); kh=bracket_above(hi,d)
    return kl,kh,lo,hi
# use the CHOSEN rational endpoints (what the proof actually has)
c23_lo, c23_hi = F(78013,10000000), F(78074,10000000)
c13_lo, c13_hi = F(319953,10000000), F(320171,10000000)
# Note: proof uses chosen Nu/Nd endpoints; use true for now
print("mix23 from cross[%.7f,%.7f] Nu[%.6f,%.6f] Nd[%.6f,%.6f]:"%(
    float(c23_lo),float(c23_hi),float(Nu23_lo),float(Nu23_hi),float(Nd23_lo),float(Nd23_hi)))
kl,kh,lo,hi=mix_bracket(c23_lo,c23_hi,Nu23_lo,Nu23_hi,Nd23_lo,Nd23_hi,10000000)
print("  true [%.10f,%.10f] chosen [5332/1e7,5342/1e7]=[%.7f,%.7f] ok=%s"%(
    float(lo),float(hi),5332/1e7,5342/1e7, F(5332,10000000)<=lo and hi<=F(5342,10000000)))
kl,kh,lo,hi=mix_bracket(c13_lo,c13_hi,Nu13_lo,Nu13_hi,Nd13_lo,Nd13_hi,100000000)
print("mix13 true [%.11f,%.11f] chosen [3191/1e8,3197/1e8] ok=%s"%(
    float(lo),float(hi), F(3191,100000000)<=lo and hi<=F(3197,100000000)))
