from fractions import Fraction as F

def cct(k): return F(k*k, 3)          # X3 coloured census term = k^2/Nc, Nc=3
def bandCensus(levels): return sum(cct(k) for k in levels)

print("=== X3 plateaus (banked, CORRECT R-ratio values) ===")
for lbl,lv in [("{u,d,s}",[2,1,1]),("{u,d,s,c}",[2,1,1,2]),("{u,d,s,c,b}",[2,1,1,2,1]),("{u,d}",[2,1])]:
    print(f"  {lbl:12s} {str(lv):14s} = {bandCensus(lv)}")
print()

print("=== the 3 derived freeze-out edge SPANS + resolved-content census ===")
print("  rb=edgeBottom=m_b/m_c span [m_c,m_b]: resolved {u,d,s,c} ->", bandCensus([2,1,1,2]))
print("  rc=edgeCharm =m_c/m_s span [m_s,m_c]: resolved {u,d,s}   ->", bandCensus([2,1,1]))
print("  rl=edgeLight =m_s/Λ   span [Λ,m_s]:   resolved {u,d}     ->", bandCensus([2,1]))
print()
banked    = (F(11,3), F(10,3), F(2))
corrected = (bandCensus([2,1,1,2]), bandCensus([2,1,1]), bandCensus([2,1]))
print("banked    (rb,rc,rl) =", banked,    " total =", sum(banked))
print("corrected (rb,rc,rl) =", corrected, " total =", sum(corrected))
print("  surplus banked-corrected total census =", sum(banked)-sum(corrected))
print()
print("=== census STEPS (frozen flavour test) ===")
print("  rb->rc step =", corrected[0]-corrected[1], " charm cct(2)=", cct(2))
print("  rc->rl step =", corrected[1]-corrected[2], " strange cct(1)=", cct(1))
print()

# Recompose. logs (from ComposedFreezeoutDissolved):
#   log(rb)=L_mb+L_b0-L_b2 ; log(rc)=-L_mb ; log(rl)=L_mb + (8pi/3) + L_b2
# summand = kappa*[ wb*log rb + wc*log rc + wl*log rl ], kappa=1/(3pi)
# kappa*wl*(8pi/3) = wl*(8/9)  is the pure rational "gem".
# The L-coefficients (inside kappa*[...]) are:
#   coeff L_mb = wb - wc + wl
#   coeff L_b0 = wb
#   coeff L_b2 = -wb + wl
def recompose(w):
    wb,wc,wl = w
    gem = wl*F(8,9)                 # kappa*wl*8pi/3 = wl*8/9
    cmb = wb - wc + wl
    cb0 = wb
    cb2 = -wb + wl
    return gem,cmb,cb0,cb2
for name,w in [("BANKED",banked),("CORRECTED",corrected)]:
    gem,cmb,cb0,cb2 = recompose(w)
    print(f"{name}: summand = {gem}  + kappa*[ {cmb}*L_mb + {cb0}*L_b0 + {cb2}*L_b2 ]")
print()
print("Note: banked gem = 2*8/9 = 16/9 (matches ComposedFreezeoutDissolved.confinement_rung_rational).")
print("      corrected gem = 5/3*8/9 = 40/27.")
