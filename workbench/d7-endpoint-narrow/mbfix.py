from fractions import Fraction as F
from math import factorial, floor, ceil

def partialExp(y, N): return sum(y**i / F(factorial(i)) for i in range(N))
def expRemBound(y, N): return (y**N / F(factorial(N))) / (1 - y/(N+1))

# q bracket
q_lo=F(707106781186547,10**15); q_hi=F(707106781186548,10**15)
assert q_lo*q_lo <= F(1,2) <= q_hi*q_hi
# mbR = (1-q)^2/(3(1+q)) decreasing => mbR_lo uses q_hi, mbR_hi uses q_lo
mbR_lo_exact=(1-q_hi)**2/(3*(1+q_hi)); mbR_hi_exact=(1-q_lo)**2/(3*(1+q_lo))
print("mbR exact [%.20f, %.20f]" % (float(mbR_lo_exact), float(mbR_hi_exact)))
# clean 18-digit rational mbR bracket (OUTWARD)
D=10**18
mbR_lo = F(floor(float(mbR_lo_exact)*D), D)
mbR_hi = F(ceil(float(mbR_hi_exact)*D), D)
# guarantee outward with margin (float can be off) -> widen by 1 unit each
mbR_lo -= F(1,D); mbR_hi += F(1,D)
assert mbR_lo <= mbR_lo_exact, (float(mbR_lo), float(mbR_lo_exact))
assert mbR_hi_exact <= mbR_hi
print("mbR clean [%s, %s]" % (mbR_lo, mbR_hi))
print("  = [%.20f, %.20f]" % (float(mbR_lo), float(mbR_hi)))
# 1/mbR bracket
inv_mb_lo = 1/mbR_hi; inv_mb_hi = 1/mbR_lo
print("1/mbR in [%.13f, %.13f]" % (float(inv_mb_lo), float(inv_mb_hi)))
umb_lo=F(40893066400067,10**13); umb_hi=F(40893066400068,10**13)
# need: partialExp(umb_lo,N)+rem <= inv_mb_lo ; inv_mb_hi <= partialExp(umb_hi,N)
for N in range(24,40):
    if partialExp(umb_lo,N)+expRemBound(umb_lo,N) <= inv_mb_lo:
        print("  L_mb lo cert N=%d ok (%.15f <= %.15f)"%(N, float(partialExp(umb_lo,N)+expRemBound(umb_lo,N)), float(inv_mb_lo))); break
for N in range(24,40):
    if inv_mb_hi <= partialExp(umb_hi,N):
        print("  L_mb hi cert N=%d ok (%.15f <= %.15f)"%(N, float(inv_mb_hi), float(partialExp(umb_hi,N)))); break

# Now the mbR clean bracket must be PROVABLE from mbRatioDerived_closed + q bracket via nlinarith.
# Rung1 does: rw[mbRatioDerived_closed]; rw[le_div_iff]; nlinarith[q_sharp_hi,q_pos,q_lt_one,q_sq]
# Check the nlinarith target for mbR_lo:  mbR_lo * (3(1+q)) <= (1-q)^2  given q<=q_hi (q_sharp_hi)
# and for mbR_hi: (1-q)^2 <= mbR_hi*(3(1+q)) given q>=q_lo
# We need q_sharp bracket at 15 digits. Provide q_sharp_lo=q_lo, q_sharp_hi=q_hi provable via nlinarith[q_sq,q_pos].
# verify q_lo,q_hi nlinarith-feasible: q_lo^2<=1/2 with margin, q_hi^2>=1/2 with margin
print()
print("q_lo^2 = %.18f (<=0.5 margin %.2e)"%(float(q_lo*q_lo), float(F(1,2)-q_lo*q_lo)))
print("q_hi^2 = %.18f (>=0.5 margin %.2e)"%(float(q_hi*q_hi), float(q_hi*q_hi-F(1,2))))
print()
print("FINAL cutLog brackets:")
print("  L_b0 = cutLog mass0 in [17337287949546/1e13, 17337287949547/1e13]")
print("  L_b2 = cutLog mass2 in [-10887237252237/1e13, -10887237252236/1e13]")
print("  L_mb = cutLog mbR   in [-40893066400068/1e13, -40893066400067/1e13]")
print("  L_m01 (NB11)        in [815406111272/1e11, 815406111273/1e11]")
