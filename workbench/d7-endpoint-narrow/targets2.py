"""
Node 4: compute EXACT rational cutLog target brackets + exp-instrument witnesses,
verifying the certification inequalities in exact rational arithmetic (fractions),
mirroring the banked cutLog_ge_certified / cutLog_le_certified pattern.

cutLog_ge_certified(a, v, N): proves v <= cutLog a, needs partialExp(v,N)+expRemBound(v,N) <= a
cutLog_le_certified(a, v, N): proves cutLog a <= v, needs a <= partialExp(v,N)

partialExp(y,N) = sum_{i<N} y^i / i!
expRemBound(y,N) = (y^N/N!) / (1 - y/(N+1))   [needs y<N+1]
"""
from fractions import Fraction as F
from math import factorial

def partialExp(y, N):
    return sum(y**i / F(factorial(i)) for i in range(N))
def expRemBound(y, N):
    return (y**N / F(factorial(N))) / (1 - y/(N+1))

# ---------- L_b0 = cutLog mass0 ----------
# clean 15-digit mass0 bracket (outward from s6):
mass0_lo = F(5661726012625403, 10**15)
mass0_hi = F(5661726012625422, 10**15)
# target cutLog bracket ~ 1.73372879495463  (find v_lo, v_hi at 1e-12 width)
# ln(mass0) ~ 1.7337287949546308
# choose v_lo, v_hi as 13-digit rationals
vb0_lo = F(17337287949546, 10**13)   # 1.7337287949546
vb0_hi = F(17337287949547, 10**13)   # 1.7337287949547
# certify: partialExp(vb0_lo,N)+rem <= mass0_lo   (lower)
#          mass0_hi <= partialExp(vb0_hi,N)        (upper)
for N in range(20, 30):
    L = partialExp(vb0_lo, N) + expRemBound(vb0_lo, N)
    if L <= mass0_lo:
        Nlo = N; break
for N in range(20, 30):
    if mass0_hi <= partialExp(vb0_hi, N):
        Nhi = N; break
print("L_b0: cutLog mass0 in [%s, %s]" % (vb0_lo, vb0_hi))
print("   lower cert N=%d (partialExp+rem <= mass0_lo: %s)" % (Nlo, (partialExp(vb0_lo,Nlo)+expRemBound(vb0_lo,Nlo))<=mass0_lo))
print("   upper cert N=%d (mass0_hi <= partialExp: %s)" % (Nhi, mass0_hi<=partialExp(vb0_hi,Nhi)))
print("   ref cutLog mass0 ~ 1.7337287949546308")
print()

# ---------- L_b2 = cutLog mass2 = -cutLog(1/mass2) ----------
# clean 15-digit mass2 bracket:
mass2_lo = F(168322936140643, 5*10**14)
mass2_hi = F(168322936140649, 5*10**14)
# 1/mass2 bracket: [1/mass2_hi, 1/mass2_lo]
inv2_lo = 1/mass2_hi   # lower of 1/mass2
inv2_hi = 1/mass2_lo
print("1/mass2 in [%s, %s] ~ [%.15f, %.15f]" % (inv2_lo, inv2_hi, float(inv2_lo), float(inv2_hi)))
# cutLog(1/mass2) ~ 1.08872372522362  ; want bracket [u_lo, u_hi], then L_b2 in [-u_hi, -u_lo]
ub2_lo = F(10887237252236, 10**13)   # 1.0887237252236
ub2_hi = F(10887237252237, 10**13)   # 1.0887237252237
# certify u_lo <= cutLog(inv2_lo_rational) via ge:  partialExp(u_lo,N)+rem <= inv2_lo
#         cutLog(inv2_hi_rational) <= u_hi via le:  inv2_hi <= partialExp(u_hi,N)
# But we need clean rationals for the 1/mass2 endpoints to feed the instrument. Use inv2_lo/hi directly.
for N in range(18, 28):
    if partialExp(ub2_lo, N)+expRemBound(ub2_lo, N) <= inv2_lo:
        Nb2lo=N; break
for N in range(18, 28):
    if inv2_hi <= partialExp(ub2_hi, N):
        Nb2hi=N; break
print("L_b2: cutLog mass2 in [%s, %s]" % (-ub2_hi, -ub2_lo))
print("   cutLog(1/mass2) in [%s, %s]" % (ub2_lo, ub2_hi))
print("   lower(u_lo) cert N=%d ok=%s" % (Nb2lo, partialExp(ub2_lo,Nb2lo)+expRemBound(ub2_lo,Nb2lo)<=inv2_lo))
print("   upper(u_hi) cert N=%d ok=%s" % (Nb2hi, inv2_hi<=partialExp(ub2_hi,Nb2hi)))
print("   ref cutLog mass2 ~ -1.08872372522362129")
print()

# ---------- L_mb = cutLog mbR = -cutLog(1/mbR) ----------
# mbR from q 15-digit bracket:
q_lo = F(707106781186547, 10**15)
q_hi = F(707106781186548, 10**15)   # 176776695296637/25e13 == 707106781186548/1e15
# verify q_lo^2 <= 1/2 <= q_hi^2
print("q bracket check: q_lo^2<=1/2:", q_lo*q_lo<=F(1,2), " q_hi^2>=1/2:", q_hi*q_hi>=F(1,2))
# mbR = (1-q)^2/(3(1+q)) decreasing in q: mbR_lo uses q_hi, mbR_hi uses q_lo
mbR_lo = (1-q_hi)**2/(3*(1+q_hi))
mbR_hi = (1-q_lo)**2/(3*(1+q_lo))
inv_mb_lo = 1/mbR_hi
inv_mb_hi = 1/mbR_lo
print("mbR in [%.18f, %.18f]" % (float(mbR_lo), float(mbR_hi)))
print("1/mbR in [%.12f, %.12f]" % (float(inv_mb_lo), float(inv_mb_hi)))
# cutLog(1/mbR) ~ 4.08930664000671
umb_lo = F(40893066400067, 10**13)   # 4.0893066400067
umb_hi = F(40893066400068, 10**13)   # 4.0893066400068
for N in range(26, 40):
    if partialExp(umb_lo, N)+expRemBound(umb_lo, N) <= inv_mb_lo:
        Nmblo=N; break
for N in range(26, 40):
    if inv_mb_hi <= partialExp(umb_hi, N):
        Nmbhi=N; break
print("L_mb: cutLog mbR in [%s, %s]" % (-umb_hi, -umb_lo))
print("   cutLog(1/mbR) in [%s, %s]" % (umb_lo, umb_hi))
print("   lower(u_lo) cert N=%d ok=%s" % (Nmblo, partialExp(umb_lo,Nmblo)+expRemBound(umb_lo,Nmblo)<=inv_mb_lo))
print("   upper(u_hi) cert N=%d ok=%s" % (Nmbhi, inv_mb_hi<=partialExp(umb_hi,Nmbhi)))
print("   ref cutLog mbR ~ -4.08930664000671142")
print()

# ---------- reassemble endpoint ----------
klo = F(1250000000, 3926990817) / 3
khi = F(50000000000, 157079632679) / 3
L_m01_lo = F(815406111272, 10**11); L_m01_hi = F(815406111273, 10**11)
# cInner-scaled coeffs (bare): 2, 7/3, 11/3, -5/3
# inner = 2 L_m01 + 7/3 L_mb + 11/3 L_b0 - 5/3 L_b2
Lb0_lo, Lb0_hi = vb0_lo, vb0_hi
Lmb_lo, Lmb_hi = -umb_hi, -umb_lo
Lb2_lo, Lb2_hi = -ub2_hi, -ub2_lo
inner_lo = 2*L_m01_lo + F(7,3)*Lmb_lo + F(11,3)*Lb0_lo - F(5,3)*Lb2_hi
inner_hi = 2*L_m01_hi + F(7,3)*Lmb_hi + F(11,3)*Lb0_hi - F(5,3)*Lb2_lo
base = F(2425,18)
e_lo = base + klo*inner_lo
e_hi = base + khi*inner_hi
print("inner in [%.15f, %.15f] width %.2e" % (float(inner_lo), float(inner_hi), float(inner_hi-inner_lo)))
print("ENDPOINT in [%.13f, %.13f]" % (float(e_lo), float(e_hi)))
print("   width = %.3e" % float(e_hi-e_lo))
import math
print("   ~ sig digits: %.1f" % (-math.log10(float(e_hi-e_lo)/float(e_lo))))
# suggest clean rational endpoint bracket
print("   suggest outer rational bracket:")
print("     lo floor 13dp:", math.floor(float(e_lo)*10**11)/10**11)
print("     hi ceil  13dp:", math.ceil(float(e_hi)*10**11)/10**11)
