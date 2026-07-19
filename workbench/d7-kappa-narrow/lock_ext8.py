"""
EXACT-ARITHMETIC LOCK for ext8 (1e13-grid kappa) + DEEPENED edge logs (one rung), re-assembling
the D7 endpoint at >=15 sig digits. All asserted inequalities are pure ℚ; mpmath only CHOOSES
constants + numerically checks the exp-instrument certification inequalities.
"""
from fractions import Fraction as F
from mpmath import mp, mpf, pi, cos, exp, log, sqrt, factorial as mfact
from math import factorial
mp.dps = 90

def to_mpf(fr): return mpf(fr.numerator)/mpf(fr.denominator)

# ============================================================
# (A) ext8 kappa bracket (from design_lcz13.py, already validated)
# ============================================================
inv_lo = F(5000000000000,15707963267949)   # = 1/cutPi lower
inv_hi = F(1250000000000,3926990816987)     # = 1/cutPi upper
klo, khi = inv_lo/3, inv_hi/3
print("=== (A) kappa ext8 ===")
print("1/cutPi in [%s, %s]  width %.3e" % (inv_lo, inv_hi, float(inv_hi-inv_lo)))
print("nested in ext7 [100000000000/314159265359, 250000000000/785398163397]?",
      inv_lo >= F(100000000000,314159265359), inv_hi <= F(250000000000,785398163397))
print()

# ============================================================
# (B) s7 source brackets (banked in Rung3) -> tighter mass0/mass2/mbRatio
# ============================================================
# mass0 = b0^2, b0 in [2379438171633255409/1e18, 2379438171633255413/1e18]
b0_lo = F(2379438171633255409, 10**18); b0_hi = F(2379438171633255413, 10**18)
mass0_lo = b0_lo*b0_lo; mass0_hi = b0_hi*b0_hi
print("=== (B) s7 source brackets ===")
print("mass0 in [%.18f, %.18f] width %.3e" % (float(mass0_lo), float(mass0_hi), float(mass0_hi-mass0_lo)))

# mass2 = b2^2, b2 = 1 - (wp - wr)/2
wp_lo = F(1379438171633255409, 10**18); wp_hi = F(1379438171633255413, 10**18)
wr_lo = F(539862011928329837, 10**18);  wr_hi = F(134965502982082463, 250*10**15)
# b2 decreasing in wp, increasing in wr:  b2 = 1 - (wp - wr)/2
b2_lo = 1 - (wp_hi - wr_lo)/2
b2_hi = 1 - (wp_lo - wr_hi)/2
print("b2 in [%.18f, %.18f] width %.3e" % (float(b2_lo), float(b2_hi), float(b2_hi-b2_lo)))
mass2_lo = b2_lo*b2_lo; mass2_hi = b2_hi*b2_hi
print("mass2 in [%.18f, %.18f] width %.3e" % (float(mass2_lo), float(mass2_hi), float(mass2_hi-mass2_lo)))
print("  check b2>0:", b2_lo>0)

# mbRatioDerived = (1-q)^2/(3(1+q)), q^2=1/2, deepen q to 1e18
# 1/sqrt2 = 0.70710678118654752440084436210...
q_true = 1/sqrt(mpf(2))
print("q_true (1/sqrt2) =", mp.nstr(q_true, 22))
qg = 10**18
q_flo = int(mp.floor(q_true*qg))
q_lo = F(q_flo, qg); q_hi = F(q_flo+1, qg)
print("q in [%s, %s] = [%.18f, %.18f]" % (q_lo, q_hi, float(q_lo), float(q_hi)))
# verify q_lo^2 <= 1/2 <= q_hi^2  (so nlinarith [q_sq] can derive these from q*q=1/2)
print("  q_lo^2 <= 1/2 ?", q_lo*q_lo <= F(1,2), "  1/2 <= q_hi^2 ?", F(1,2) <= q_hi*q_hi)
# mbRatioDerived decreasing in q on (0,1):
mb_lo = (1-q_hi)**2/(3*(1+q_hi))
mb_hi = (1-q_lo)**2/(3*(1+q_lo))
print("mbRatioDerived in [%.20f, %.20f] width %.3e" % (float(mb_lo), float(mb_hi), float(mb_hi-mb_lo)))
print()

# ============================================================
# (C) DEEPENED EDGE LOGS at grid 1e14 (one rung deeper than 1e13)
#     certify via exp instrument at deeper indices
# ============================================================
def partialExp(a, N):
    a = mpf(a)
    return sum(a**i/mfact(i) for i in range(N))
def expRemBound(a, N):
    a = mpf(a)
    return (a**N/mfact(N)) * 1/(1 - a/(N+1))

def choose_log_bracket(src_lo, src_hi, grid, name, idxlo, idxhi):
    """log(x) for x in [src_lo, src_hi]. Return (a_lo, a_hi) rational bounds on grid, with
       certification: partialExp(a_lo,idxlo)+expRemBound(a_lo,idxlo) <= src_lo   (=> a_lo <= log src_lo)
                       src_hi <= partialExp(a_hi,idxhi)                          (=> log src_hi <= a_hi)."""
    L_lo_true = log(to_mpf(src_lo)); L_hi_true = log(to_mpf(src_hi))
    a_lo = F(int(mp.floor(L_lo_true*grid)), grid)   # <= true log src_lo
    a_hi = F(int(mp.ceil (L_hi_true*grid)), grid)   # >= true log src_hi
    # certify lower: partialExp(a_lo,idxlo)+expRemBound(a_lo,idxlo) <= src_lo
    la = to_mpf(a_lo)
    cert_lo = partialExp(la, idxlo) + expRemBound(la, idxlo)
    ok_lo = cert_lo <= to_mpf(src_lo)
    # certify upper: src_hi <= partialExp(a_hi, idxhi)
    ha = to_mpf(a_hi)
    cert_hi = partialExp(ha, idxhi)
    ok_hi = to_mpf(src_hi) <= cert_hi
    print(f"  {name}: log in [{a_lo}, {a_hi}] width {float(a_hi-a_lo):.3e}")
    print(f"     cert_lo (pe+rem<=src_lo) idx{idxlo}: {ok_lo}   cert_hi (src_hi<=pe) idx{idxhi}: {ok_hi}")
    return a_lo, a_hi, ok_lo, ok_hi

print("=== (C) deepened edge logs at grid 1e14 ===")
# L_b0 = log mass0  (~1.7337)
Lb0_lo, Lb0_hi, o1, o2 = choose_log_bracket(mass0_lo, mass0_hi, 10**14, "L_b0", 20, 21)
# L_b2 = log mass2 (~ -1.0887): use reciprocal 1/mass2 -> log positive
inv_mass2_lo = F(1,1)/mass2_hi; inv_mass2_hi = F(1,1)/mass2_lo
Lb2i_lo, Lb2i_hi, o3, o4 = choose_log_bracket(inv_mass2_lo, inv_mass2_hi, 10**14, "L_b2^{-1}(=-L_b2)", 16, 17)
Lb2_lo, Lb2_hi = -Lb2i_hi, -Lb2i_lo
print(f"     => L_b2 in [{Lb2_lo}, {Lb2_hi}] width {float(Lb2_hi-Lb2_lo):.3e}")
# L_mb = log mbRatioDerived (~ -4.0893): reciprocal
inv_mb_lo = F(1,1)/mb_hi; inv_mb_hi = F(1,1)/mb_lo
Lmbi_lo, Lmbi_hi, o5, o6 = choose_log_bracket(inv_mb_lo, inv_mb_hi, 10**14, "L_mb^{-1}(=-L_mb)", 28, 29)
Lmb_lo, Lmb_hi = -Lmbi_hi, -Lmbi_lo
print(f"     => L_mb in [{Lmb_lo}, {Lmb_hi}] width {float(Lmb_hi-Lmb_lo):.3e}")
print("  ALL cert ok?", all([o1,o2,o3,o4,o5,o6]))
print()

# L_m01 s7 (banked in Rung3, reuse verbatim)
Lm01_lo = F(815406111272599, 10**14); Lm01_hi = F(815406111272603, 10**14)

# ============================================================
# (D) RE-ASSEMBLE the endpoint
# ============================================================
base = F(2425,18)
def combo(cL, cLmb, cLb0, cLb2):
    lo = hi = F(0)
    for c,(a,b) in [(cL,(Lm01_lo,Lm01_hi)),(cLmb,(Lmb_lo,Lmb_hi)),(cLb0,(Lb0_lo,Lb0_hi)),(cLb2,(Lb2_lo,Lb2_hi))]:
        if c>0: lo += c*a; hi += c*b
        else:   lo += c*b; hi += c*a
    return lo,hi

print("=== (D) re-assembled endpoint (ext8) ===")
for nm, coeffs, target in [("BARE",(F(2),F(7,3),F(11,3),F(-5,3)),137),
                           ("DRESSED",(F(3),F(7,2),F(11,2),F(-5,2)),137)]:
    clo,chi = combo(*coeffs)
    e_lo = base + klo*clo
    e_hi = base + khi*chi
    print(f"{nm}: inner in [{float(clo):.13f}, {float(chi):.13f}] width {float(chi-clo):.3e}")
    print(f"   endpoint in [{float(e_lo):.15f}, {float(e_hi):.15f}] width {float(e_hi-e_lo):.3e}")
    sig = -mp.log10(float(e_hi-e_lo)/136.307)
    print(f"   ~{float(sig):.2f} sig digits  {'>=15 OK' if sig>=15 else '<15 FAIL'}")
    print(f"   nested in Rung3? lo>=1363071881405515/1e13 (bare) etc:",
          e_lo >= (F(1363071881405515,10**13) if nm=='BARE' else F(1370996710997162,10**13)),
          e_hi <= (F(1363071881405528,10**13) if nm=='BARE' else F(1370996710997180,10**13)))
    print()
